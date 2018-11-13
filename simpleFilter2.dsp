import("stdfaust.lib");

maxDel = 12;
intDel = 6;

//phasor(tablesize,freq)
tableSize = 2400;
freq = hslider("[0]freq",0.5,30,200,0.01) : si.smoo; //smooth values of sliders; ;

b0 = hslider("[1]b0",0.1,0,10.,0.01) : si.smoo; //smooth values of sliders;
bM = hslider("[2]bM",0.5,0,10.,0.01) : si.smoo; //smooth values of sliders;

gain = hslider("[3]gain",0,0,1,0.01) : si.smoo; //smooth values of sliders;



process = os.phasor(tableSize,freq) : fi.ff_comb(maxDel,intDel,b0,bM) : *(gain); //
