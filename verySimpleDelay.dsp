import("stdfaust.lib");
import("filter.lib");
import("music.lib");
import("oscillator.lib");

//Static Delay
// process = _@48000; 
//static delay length (@ operator)

//Dynamic Delay
//process = delay(); 
//dynamic delay length delay function -> delay(max del length,delay length), max del length is for memory allocation, must be a power of 2, if the sampling rate is 48kHz (48000), the delay must be at least the next power of 2^16 = 65536, for 1 sec delay.

maxDelay = 65536;
//delLength = hslider("Delay Duration (ms)",100,1,1000,0.1)*0.001/SR : int;
//milliseconds*0.001(convert in seconds)/SR(in music.lib):int(round the results to integer)
//with smooth
delLength = hslider("Delay Duration (ms)",100,1,1000,0.1)*0.001/SR : smooth(0.999);

process = delay(maxDelay,delLength);