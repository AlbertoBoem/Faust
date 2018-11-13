import("stdfaust.lib");
import("music.lib");
import("filter.lib");
import("oscillator.lib");


freq = hslider("frequency",300,20,2000,0.01) : smooth(0.999);
gain = hslider("gain",0.3,0,1,0.01);
t = hslider("attackRelease (sec)",0.1,0.001,2,0.001);
gate = button("gate") : smooth(tau2pole(t)); //kind of exponential adsr


process = osc(freq),osc(freq*2),osc(freq*3) :> /(3) *(gain)*gate;  
//3 sinewaves in parallel harmonics, octaves