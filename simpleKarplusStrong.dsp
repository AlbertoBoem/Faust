import("stdfaust.lib");
import("music.lib");
import("filter.lib");

//use fractional delay to have the "string" in "tune" fdelay4 very high interpolation
//sampling rate of computer 48kHz so 48000 % 50hz (the minimum freq to play) = 960 the next power of 2 is 1024

myString(freq, feedback) = +~(fdelay4(1024,delLength) <: (_+_')/2  : *(feedback)) //add a low-pass filter <: (_+_')/2  to smooth the signal
with{
	
   delLength = SR/freq -1; //-1 because the fdelay is one sample delay

};

frequency = hslider("freq",440,51,2000,0.01);
feedback = hslider("feedback",0.9,0.9,1,0.01); //controls the damping of the string
gate = button("gate");


impulse = gate <: _,_' : - : >(0); //to better control the debouncing of button, so signal when release, (when press=1, when release=0)
//split the impulse signal in two, one of them is delayed by one sample (') and subtract them (-)

process = impulse : myString(frequency,feedback);