#//////////////homework2/////////////////
#///AM=4001 , AM=4812
#0 0 0 =0
#0 0 1 =0
#0 1 0 =0
#0 1 1 =0
#1 0 0 =0
#1 0 1 =0
#1 1 0 =1
#1 1 1 =0

function set2_1
  #//////////////2.1///////////////
  I = [ 0 0 0;
        0 0 1;
        0 1 0;
        0 1 1;
        1 0 0;
        1 0 1;
        1 1 0;
        1 1 1];
  fprintf("----------- ask 2.1 ---------------\n");
  for i = 1:size(I)
    fprintf("----------- Gramh pinaka alitheias %i ---------------\n",i);
    a = I(i,1)
    b = I(i,2)
    c = I(i,3)
    circuit(a,b,c);
  end
endfunction

function d=circuit(a,b,c)
  e=sp2AND(a,b)
  f=spNOT(c)
  d=sp2AND(e,f)
endfunction

function s=sp2AND(input1sp, input2sp)
  s = input1sp*input2sp;
  Esw=2*s*(1-s)
endfunction

function s=spNOT(in1)
  s=1-in1;
  Esw=2*s*(1-s)
endfunction

