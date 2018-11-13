import("stdfaust.lib");

//cutFreq = 500;
//q = 5;
//gain = 1;

cutFreq = hslider("[0]cutoff frequency",500,0,2000,0.01) : si.smoo; //smooth values of sliders
q = hslider("[1]q",5,0,10,0.1) : si.smoo; //smooth values of sliders
gain = hslider("[2]gain",0.5,0,1,0.01) : si.smoo; //smooth values of sliders;

filter = fi.resonlp(cutFreq,q,gain);
process = no.noise <: filter,filter; 

//makes it stereo -> (noise) <: "split operator" used here takes n signals and split them into m signals. 
//The only rule is that m has to be a multiple of n
//the two filters runs in paraller