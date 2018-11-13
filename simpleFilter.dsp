import("stdfaust.lib");

//cutFreq = 500;
//q = 5;
//gain = 1;

cutFreq = hslider("cutoff frequency",500,0,2000,0.01) : si.smoo; //smooth values of sliders
q = hslider("q",5,0,10,0.1) : si.smoo; //smooth values of sliders
gain = hslider("gain",0.5,0,1,0.01) : si.smoo; //smooth values of sliders;

process = no.noise : fi.resonlp(cutFreq,q,gain); //resonant lpf

//noise->res low pass filter->out