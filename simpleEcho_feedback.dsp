import("stdfaust.lib");
import("filter.lib");

//-->look at the figure of Echo Feedback

myEcho = +~(fdelay(65536,delayLength)*feedback*-1)
with{
	
	delayLength = vslider("Time (millisec)",250,0.1,1000,0.1)*0.001*SR : smooth(0.999);
	//*0.001 (from millisec to seconds) * SR (sampling rate) = convert to samples
	
	feedback = vslider("Feedback",0,0,1,0.001) : smooth(0.999);

};

process =  myEcho;