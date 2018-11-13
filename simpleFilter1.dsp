import("stdfaust.lib");

maxDel = 12;
intDel = 6;
//b0 = 0.1;
//bM = 0.5;

//maxDel = hslider("max delay”,2,0,16,1) : si.smoo; //smooth values of sliders
//intDel = hslider("intDel”,2,0,16,1) : si.smoo; //smooth values of sliders
b0 = hslider("b0",0.1,0,10.,0.01) : si.smoo; //smooth values of sliders;
bM = hslider("bM",0.5,0,10.,0.01) : si.smoo; //smooth values of sliders;

gain = hslider("gain",0.5,0,1,0.01) : si.smoo; //smooth values of sliders;



process = no.noise : fi.ff_comb(maxDel,intDel,b0,bM) : *(gain); //

