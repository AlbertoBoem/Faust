import("stdfaust.lib");

N = 4;

//i = where the number of iterations are stored, it can be used to read through

//par = parallel proces
//process = par(i,N,os.osc(440*(i+1))) :> /(4); //divide by the number of the signal

//prod = multiply different signals together
//process = prod(i,N,os.osc(440*(i+1))) :> /(4);

//seq = sequence of multiplications by (0.09)
process = = seq(i,N,*(0.09));

//Similar to an array
//process = take(1,x);

x = (1,2,3,4); //variable

//change values of elements of the array
//x(1) = 11;
//x(2) =12;

xx(j) = take(j+1,x);
//process = xx(0); //0 is the first argument of the array x=1

//use these thing for creating a parallel process
process = par(i,N,xx(i));

