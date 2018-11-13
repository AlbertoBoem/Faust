import("stdfaust.lib");
import("filter.lib");


myOnePoleFilter = +~(delay(2048,delLength)*(-a1))
with{

   a1 = hslider("a1",0,-1,0.999,0.001) : smooth(0.999);
   delLength = hslider("delay length",1,1,2000,1);
	
};

process = noise : myOnePoleFilter;
