import("stdfaust.lib");

f1(i) = hslider("freq1%3i",300,0,2000,0.001) : si.smoo;
f2(i) = hslider("freq2%3i",500,0,2000,0.001) : si.smoo;
f3(i)= hslider("freq3%3i",500,0,2000,0.001) : si.smoo;

f4(i) = hslider("freq4%3i",500,0,2000,0.001) : si.smoo;

i1(i) = hslider("i1%3i",20,0,200,0.001) : si.smoo;
i2(i) = hslider("i2%3i",30,0,200,0.001) : si.smoo;
i3(i) = hslider("i3%3i",40,0,200,0.001) : si.smoo;

i4(i) = hslider("i4%3i",40,0,200,0.001) : si.smoo;

cutFreq(i) = hslider("cutofffrequency%3i",500,0,2000,0.01) : si.smoo; 
q(i) = hslider("q%3i",5,0,10,0.1) : si.smoo; 
gain(i) = hslider("gain%3i",0.5,0,1,0.01) : si.smoo; 

freqs = (f1,f2,f3,f4);
indices = (i1,i2,i3,i4);

trigger = button("gate") : si.smoo;

filter = fi.resonlp(cutFreq,q,gain);

out = sy.fm(freqs,indices); 

process = out <: filter* trigger,filter * trigger <: dm.zita_rev1; 
