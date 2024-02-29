#//////////////homework2/////////////////
#///AM=4001 AM=4812

function set2_3
  fprintf("----------- ask 2.3 ---------------\n");
  MCARLO(10);
  MCARLO(100);
  MCARLO(4001);
endfunction

#//////////////2.3///////////////
function SwitchingActivity= MCARLO(N)
  out_e=0;
  newout_e=0;
  switchnumber_e=0;
  out_f=0;
  newout_f=0;
  switchnumber_f=0;
  out_d=0;
  newout_d=0;
  switchnumber_d=0;
  Workload=[];
  MonteCarloSize=N
  for i = 1:MonteCarloSize
    Workload=[Workload; round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2))];
  end
  vectorsNumber=size(Workload, 1);
  for i=1:vectorsNumber

    out_e=newout_e;
    out_f=newout_f;
    out_d=newout_d;

    e= Workload(i,1) & Workload(i,2);
    newout_e=e;
    f=!(Workload(i,3));;
    newout_f=f;
    newout_d=e&f;

    if out_e!=newout_e
      switchnumber_e=switchnumber_e+1;
    endif
    if out_f!=newout_f
      switchnumber_f=switchnumber_f+1;
    endif
    if out_d!=newout_d
      switchnumber_d=switchnumber_d+1;
    endif
  endfor
  vectorsNumber
  switchnumber_e
  SwitchingActivity_for_e=switchnumber_e/(vectorsNumber-1)
  switchnumber_f
  SwitchingActivity_for_f=switchnumber_f/(vectorsNumber-1)
  switchnumber_d
  SwitchingActivity_for_b=switchnumber_d/(vectorsNumber-1)
endfunction
