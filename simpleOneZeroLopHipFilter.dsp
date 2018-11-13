import("stdfaust.lib");
import("filter.lib");
import("music.lib");
import("oscillator.lib");

//a filter
filter = _ <: _,_'*b1 :> _
with{
	
	b1 = hslider("b1",0,-1,1,0.01);
	//-1 is high pass, 1 is low pass filtering
};

//x(n)<:'(delay of 1 sample)

process = noise : filter <: _,_;