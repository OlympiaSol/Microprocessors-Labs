#//////////////homework1/////////////////
#///AM=4001 AM=4812
%%%
%%% N Monte Carlo permutations to be performed
%%%
%%% you run the program as:
%%% MCOR4(10) for 10 permutations
%%% MCOR4(20) for 20 permutations
%%% MCOR4(30) for 30 permutations
%%% etc...
%%% MCOR4(4812) for 4812 permutations

function SwitchingActivity=MCOR4(N) %% h synarthsh orizei to onoma pou lamvanei apo to N kai epistrefei thn SwitchingActivity
  for o=1:4
    fprintf("----------- LOOP %o ---------------\n",o);
  %% for dynamic power computation we need the switching activity
  %% lets consider a 4 input AND gate with the following truth table:
  %% I1 I2 I3 I4 | O
  %%  X  X  X  0 | 0
  %%  X  X  0  X | 0
  %%  X  0  X  X | 0
  %%  0  X  X  X | 0
  %%  1  1  1  1 | 1
  %% and lets try to find the power consumption of the following workload (remember workload is program)
  %%
  Workload=[0 0 0 0; 1 1 1 1; 0 0 0 1; 1 1 1 1; 0 1 0 1]; %% to workload orizei ena synolo syndyasmwn eisodwn gia thn 4OR pylh symfwna me to truth table

  N=10;     %%edo 8a allakso tis times gia N=10, N=20, N=30 , N=4001 ,N=4812

  MonteCarloSize=N %% ayto to loop kanei epipleon tyxaious syndyasmous eisodwn ston yparxonta workload ne bash to N
  for i = 1:MonteCarloSize
      Workload=[Workload; round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2)), round(mod(rand(),2))];
  end
  vectorsNumber=size(Workload, 1);
  gateInputsNumber=size(Workload, 2);
  gateOutput=0|0|0|0; # andi gia & vazw |

  switchesNumber=0;%%ayto to loop ypologizei th drasthriothta metavashs prosomoiwnontas th symperifora pylhs gia tis dedomenes eisodous kai metrwntas ton arithmo tvn metavasewn metajy diaforetikwn katastasewn ejodou
  for i = 1:vectorsNumber
      NewGateOutput=Workload(i,1) |  Workload(i,2) | Workload(i,3) | Workload(i,4);
      %NewGateOutput
      if (gateOutput==NewGateOutput)
          continue;
      else
          gateOutput=NewGateOutput;
         switchesNumber=switchesNumber+1;
      end
  end
  switchesNumber
  vectorsNumber
  SwitchingActivity=switchesNumber/(vectorsNumber -1)
 endfor

endfunction
