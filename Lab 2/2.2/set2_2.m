#//////////////homework2/////////////////
#///AM=4001 AM=4812
#0 0 0 =0
#0 0 1 =0
#0 1 0 =0
#0 1 1 =0
#1 0 0 =0
#1 0 1 =0
#1 1 0 =1
#1 1 1 =0

function set2_2
  fprintf("----------- ask 2.2 ---------------\n");
  ain=input("Give the a probability=%f\n");
  bin=input("Give the b probability=%f\n");
  cin=input("Give the c probability=%f\n");
  circuit(ain,bin,cin);
endfunction

function d=circuit(a,b,c)
  fprintf("TO SWITCHING ACTIVITY THS PYLHS ME SHMA e EINAI: %f");
  e=sp2AND(a,b);
  fprintf("\nTO SWITCHING ACTIVITY THS PYLHS ME SHMA f EINAI: %f");
  f=spNOT(c);
  fprintf("\nTO SWITCHING ACTIVITY THS PYLHS ME SHMA d EINAI: %f");
  d=sp2AND(e,f);
endfunction

function s=sp2AND(input1sp, input2sp)
  s = input1sp*input2sp;
  Esw=2*s*(1-s)
endfunction

function s=spNOT(in1)
  s=1-in1;
  Esw=2*s*(1-s)
endfunction
