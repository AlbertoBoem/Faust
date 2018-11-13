import("stdfaust.lib");
import("filter.lib");
import("music.lib");
import("oscillator.lib");

myFlanger = _ <: _,(65536,N,_ : fdelay) :> _
with{
	modFreq = hslider("Modulation Frequency",2,1,50,0.01) : smooth(0.999);
	depth = hslider("Depth",1,1,100,0.1) : smooth(0.999);
	N = osc(modFreq)*0.5+0.51 : *(depth);
};

process = noise : myFlanger <:_,_;