import("stdfaust.lib");
import("filter.lib");

myFbComb = +~(delay(2048,delLength)*(-a1))
with{
	
	a1 = hslider("a1",0,-1,0.999,0.001) : smooth(0.999);
	//a pole filter can be negative also -1,1 -> high pass (nehative) or low pass (positive)

	delLength = hslider("delayLength",1,1,2000,1);
};


process = noise : myFbComb;