import("stdfaust.lib");
import("filter.lib");

gainController = _*(gain : smooth(ba.tau2pole(interpTime))) 
//smooth=filter for interpolation - tau2pole for better interpolation
//_ is just an input signal...it will be a sawtooth later
with {  //with -> it includes the variables to the local function (gainController)
	
	gain = vslider("gain",0.5,0,1,0.1);
	interpTime = vslider("Interpolation Time (s)",0.05,0,1,0.001);
};

process = os.sawtooth(90) <: gainController,gainController; //stereo