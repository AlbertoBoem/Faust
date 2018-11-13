import("stdfaust.lib");
import("filter.lib");
import("music.lib");
import("oscillator.lib");

//a filter
filter = _ <: _,delay(65536,N)*b1 :> _
//16 max delay length, next power of 2, next power of 2 after 10
with{
	
	b1 = hslider("b1",0,-1,1,0.01);
	//-1 is high pass, 1 is low pass filtering
	N = hslider("n",1,1,500,1);
	//control delay as samples
};

//x(n)<:'(delay of 1 sample)

process = noise : filter <: _,_;