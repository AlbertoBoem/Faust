import("stdfaust.lib");
import("music.lib");
import("filter.lib");
import("oscillator.lib");


stereoRingMod = _ <: *(1-pan),*(pan)
with{
	
	freq = hslider("frequency",5,0.01,1000,0.01) : smooth(0.999);
	depth = hslider("depth",0,0,1,0.01) : smooth(0.999);
	pan = 1-depth*(osc(freq)*0.5+0.5);
};


process = triangle(440) : stereoRingMod;