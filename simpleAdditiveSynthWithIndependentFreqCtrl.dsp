import("stdfaust.lib");

//create a function of an oscillator with a slider that controsl the freq
//(n) --> any value assigned to n is goig to be assigned to each slider %n

mySine(n) = os.osc(freq)
with{
	
	freq = hslider("frequency %n",440,50,1000,0.01);

};

process =  par(i,4,mySine(i)) :> *(0.25); 
//merge the four signals and multiply to avoid clicks
//4 sine oscillators in parallel, with four sliders for each one
