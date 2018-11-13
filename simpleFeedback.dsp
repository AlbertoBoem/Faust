import("stdfaust.lib");

//~ feedback
//process = _+~_;

//process = +~*(1.5); //an operation
//or a more complex 
//process = +~(*(1.5)+1.5);

process = +~_ : *(1.5);