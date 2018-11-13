import("stdfaust.lib");
import("filter.lib");

//-->look at the figure of Echo Feedback


myEcho = _ <: *(dry),(+~(fdelay(65536,delayLength)*feedback*-1) : *(1-dry)) :> _
//split and get out the dry signal, and connecting it back at the end
// and merge them together
with{
	
	delayLength = vslider("Time (millisec)",250,0.1,1000,0.1)*0.001*SR : smooth(0.999);
	//*0.001 (from millisec to seconds) * SR (sampling rate) = convert to samples
	
	feedback = vslider("Feedback",0,0,1,0.001) : smooth(0.999);

	dry = hslider("Wet/Dry",1,0,1,0.01) : smooth(0.999);

};

process =  myEcho;