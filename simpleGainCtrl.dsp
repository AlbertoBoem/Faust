import("stdfaust.lib");

gain = hslider("gain",0.5,0,1,0.01) : si.smoo; //smooth values of sliders

process = _*(gain); //_ just an input signal (ie mic), or no.noise (white noise)