import("stdfaust.lib");
import("filter.lib");
import("music.lib");

tremolo = *(1-depth*(osc(freq)*0.5+0.5))
with{
	
	freq = hslider("frequency",5,0.1,15,0.01) : smooth(0.999);
	//frequency of the tremolo!!!
	depth = hslider("depth",0,0,1,0.01) : smooth(0.999);

};

process = osc(120)<:tremolo,tremolo;