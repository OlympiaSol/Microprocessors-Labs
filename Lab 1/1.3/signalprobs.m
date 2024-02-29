#//////////////homework1/////////////////
#///AM=4001 AM=4812
%%%
%%% ������� �� ��������� ��:
%%% signalprobs(input1sp,input2sp)
%%%
%%% ������������:
%%% >> signalprobs(0.5,0.5)
%%% AND Gate for input probabilities (0.500000 0.500000):
%%% ans =  0.25000
%%% OR Gate for input probabilities (0.500000 0.500000):
%%% ans =  0.75000
%%% XOR Gate for input probabilities (0.500000 0.500000):
%%% NAND Gate for input probabilities (0.500000 0.500000):
%%% NOR Gate for input probabilities (0.500000 0.500000):
%%%
%%%
%%% >> signalprobs(0,0)
%%% AND Gate for input probabilities (0.00000 0.00000):
%%% ans =  0
%%% OR Gate for input probabilities (0.00000 0.00000):
%%% ans =  0
%%% XOR Gate for input probabilities (0.00000 0.00000):
%%% NAND Gate for input probabilities (0.00000 0.00000):
%%% NOR Gate for input probabilities (0.00000 0.00000):
%%%
%%% >> signalprobs(1,1)
%%% AND Gate for input probabilities (1.00000 1.00000):
%%% ans =  1
%%% OR Gate for input probabilities (1.00000 1.00000):
%%% ans =  1
%%% XOR Gate for input probabilities (1.00000 1.00000):
%%% NAND Gate for input probabilities (1.00000 1.00000):
%%% NOR Gate for input probabilities (1.00000 1.00000):
%%%
%%%
%%%
%%% �� ����������� ��� ����������� �� signal probabilities
%%% AND ��� OR ����� ��� ������� ����� ��� ���������� ��������.
%%% �� ����������� ��� ����������� �� signal probabilities
%%% XOR, NAND ��� NOR ����� ��� ������� ����� ��������.
%%% (�) ��� ������� �� ������������ ��� ��������� �������� ����������� ��� ��� ����������
%%% ��� signal probabilities XOR,NAND ��� NOR 2 ������� �����.
%%% (�) ������ ����������� ��� ��� ���������� ��� signal probabilities
%%% AND, OR, XOR, NAND, NOR ����� 3 �������
%%% (�) ������ ����������� ��� ��� ���������� ��� signal probabilities
%%% AND, OR, XOR, NAND, NOR ����� � �������


function s=signalprobs(varargin)
  if nargin==1
    x1 = cell2mat(varargin);
    sp1_and_or_xor(x1);
    sp1_nand_not(x1);
  elseif nargin==2
    printf("AND Gate for input probabilities (%f %f):\n",varargin{1},varargin{2});
    sp2AND(varargin{1},varargin{2})
    printf("OR Gate for input probabilities (%f %f):\n",varargin{1},varargin{2});
    sp2OR(varargin{1},varargin{2})

    % �� �������� ����������� ������ �� ������������ ��� �� (�)
    printf("XOR Gate for input probabilities (%f %f):\n",varargin{1},varargin{2});
    sp2XOR(varargin{1},varargin{2})
    printf("NAND Gate for input probabilities (%f %f):\n",varargin{1},varargin{2});
    sp2NAND(varargin{1},varargin{2})
    printf("NOR Gate for input probabilities (%f %f):\n",varargin{1},varargin{2});
    sp2NOR(varargin{1},varargin{2})

  %Esw2(input1sp,input2sp);

  % �� �������� ����������� ������ �� ������� ��'��������� ��� �� (�)
  %sp3AND(in1, in2, in3);
  %sp3OR(in1, in2, input3sp);
  %sp3XOR(in1, in2, in3);
  %sp3NAND(in1, in2, in3);
  %sp3NOR(in1, in2, in3);
  elseif nargin == 3
  printf("AND Gate for input probabilities (%f %f %f):\n",varargin{1},varargin{2},varargin{3})
  sp3AND(varargin{1},varargin{2},varargin{3})
  printf("OR Gate for input probabilities (%f %f %f):\n",varargin{1},varargin{2},varargin{3})
  sp3OR(varargin{1},varargin{2},varargin{3})
  printf("XOR Gate for input probabilities (%f %f %f):\n",varargin{1},varargin{2},varargin{3})
  sp3XOR(varargin{1},varargin{2},varargin{3})
  printf("NAND Gate for input probabilities (%f %f %f):\n",varargin{1},varargin{2},varargin{3})
  sp3NAND(varargin{1},varargin{2},varargin{3})
  printf("NOR Gate for input probabilities (%f %f %f):\n",varargin{1},varargin{2},varargin{3})
  sp3NOR(varargin{1},varargin{2},varargin{3})

  %Esw3(input1sp,input2sp,input3sp);

  % �� �������� ����������� ������ �� ������� ��'��������� ��� �� (�)
  %% �������: ������ �� ������� ���������� ��� ����� �������� ���� ������
  %spAND(input1sp, input2sp, input3sp, input4sp ...)
  %spOR(input1sp, input2sp, input3sp, input4sp ...)
  %spXOR(input1sp, input2sp, input3sp, input4sp, ...);
  %spNAND(input1sp, input2sp, input3sp, input4sp, ...);
  %spNOR(input1sp, input2sp, input3sp, input4sp, ...);
else
  #varargin;
  x = cell2mat(varargin);
  spn_and(x);
  spn_or(x);
  spn_xor(x);
  spn_nand(x);
  spn_nor(x);
  endif
end
% 2-input AND gate truth table
% 0 0:0
% 0 1:0
% 1 0:0
% 1 1:1
%% signal probability calculator for a 2-input AND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2AND(input1sp, input2sp)
  s = input1sp*input2sp;
  SwitchingActivity(s);
endfunction
% 2-input OR gate truth table
% 0 0:0
% 0 1:1
% 1 0:1
% 1 1:1
%% signal probability calculator for a 2-input OR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2OR(input1sp, input2sp)
  #s = 1-(1-input1sp)*(1-input2sp);
  s= (input1sp*input2sp)+(input1sp*(1-input2sp))+((1-input1sp)*input2sp);
  SwitchingActivity(s);
endfunction
% 2-input XOR gate truth table
% 0 0:0
% 0 1:1
% 1 0:1
% 1 1:0
%% signal probability calculator for a 2-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2XOR(input1sp, input2sp)
  s=((1-input1sp)*input2sp)+(input1sp*(1-input2sp));
  SwitchingActivity(s);
endfunction
% 2-input NAND gate truth table
% 0 0:1
% 0 1:1
% 1 0:1
% 1 1:0
%% signal probability calculator for a 2-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2NAND(input1sp, input2sp)
  s=1-(input1sp*input2sp);
  SwitchingActivity(s);
endfunction
% 2-input NOR gate truth table
% 0 0:1
% 0 1:0
% 1 0:0
% 1 1:0
%% signal probability calculator for a 2-input NOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%%        s: output signal probability
function s=sp2NOR(input1sp, input2sp)
  s=(1-input1sp)*(1-input2sp);
  SwitchingActivity(s);
endfunction

#function s=signalprobs3(input1sp,input2sp,input3sp)
 # printf("AND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
 #sp3AND(input1sp,input2sp,input3sp);
 #printf("OR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
 #sp3OR(input1sp,input2sp,input3sp);
 #printf("XOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
 #sp3XOR(input1sp,input2sp,input3sp);
 #printf("NAND Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
 #sp3NAND(input1sp,input2sp,input3sp);
 #printf("NOR Gate for input probabilities (%f %f %f):\n",input1sp,input2sp,input3sp)
 #sp3NOR(input1sp,input2sp,input3sp);
  %Esw3(input1sp,input2sp,input3sp);
#end

% 3-input AND gate truth table
% 0 0 0:0
% 0 0 1:0
% 0 1 0:0
% 0 1 1:0
% 1 0 0:0
% 1 0 1:0
% 1 1 0:0
% 1 1 1:1
%% signal probability calculator for a 3-input AND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3AND(input1sp, input2sp,input3sp)
  s = input1sp*input2sp*input3sp;
  SwitchingActivity(s);
endfunction
% 3-input OR gate truth table
% 0 0 0:0
% 0 0 1:1
% 0 1 0:1
% 0 1 1:1
% 1 0 0:1
% 1 0 1:1
% 1 1 0:1
% 1 1 1:1
%% signal probability calculator for a 3-input OR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3OR(input1sp, input2sp,input3sp)
  s = 1-(1-input1sp)*(1-input2sp)*(1-input3sp);
  SwitchingActivity(s);
endfunction
% 3-input XOR gate truth table
% 0 0 0:0
% 0 0 1:1
% 0 1 0:1
% 0 1 1:0
% 1 0 0:1
% 1 0 1:0
% 1 1 0:0
% 1 1 1:1
%% signal probability calculator for a 3-input XOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3XOR(input1sp, input2sp,input3sp)
  s=(input1sp*(1-input2sp)*(1-input3sp)) + ((1-input1sp)*input2sp*(1-input3sp)) + ((1-input1sp)*(1-input2sp)*input3sp) + (input1sp*input2sp*input3sp);
  SwitchingActivity(s);
endfunction
% 3-input NAND gate truth table
% 0 0 0:1
% 0 0 1:1
% 0 1 0:1
% 0 1 1:1
% 1 0 0:1
% 1 0 1:1
% 1 1 0:1
% 1 1 1:0
%% signal probability calculator for a 3-input NAND gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability
function s=sp3NAND(input1sp, input2sp,input3sp)
  s =1-(input1sp*input2sp*input3sp);
  SwitchingActivity(s);
endfunction
% 3-input NOR gate truth table
% 0 0 0:1
% 0 0 1:0
% 0 1 0:0
% 0 1 1:0
% 1 0 0:0
% 1 0 1:0
% 1 1 0:0
% 1 1 1:0
%% signal probability calculator for a 3-input NOR gate
%% input1sp: signal probability of first input signal
%% input2sp: signal probability of second input signal
%% input3sp: signal probability of third input signal
%%        s: output signal probability

function s=sp3NOR(input1sp, input2sp,input3sp)
  s =(1-input1sp)*(1-input2sp)*(1-input3sp);
  SwitchingActivity(s);
endfunction
%%///////////////////////////////////////////////////////////////
%%for the N gates i'll have them change betwen them
%% 1-input AND - OR - XOR gates truth table
%%0 :0
%%1 :1
%% signal probability calculator for a 1-input AND - OR - XOR gates
%% input1sp: signal probability of first input signal
%%        s: output signal probability
function s=sp1_and_or_xor(x)
  s=x(1);
  fprintf("\n 1-input AND - OR - XOR gates signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction
%%for the N gates i'll have them change betwen them
%% 1-input NAND - NOT gates truth table
%%0 :1
%%1 :0
%% signal probability calculator for a 1-input AND - OR - XOR gates
%% input1sp: signal probability of first input signal
%%        s: output signal probability
function s=sp1_nand_not(x)
  s=1-x(1);
  fprintf("\n 1-input NAND - NOT gates signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction
function s=spn_and(x)
  s=x(1)*x(2);
  for i=3:length(x)
    s=s*x(i);
  endfor
  fprintf("\n AND GATE signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction

function s=spn_or(x)
  s=(x(1)*x(2))+(x(1)*(1-x(2)))+((1-x(1))*x(2));
  for i=3:length(x)
    s=(s*x(i))+(s*(1-x(i)))+((1-s)*x(i));
  endfor
  fprintf(" OR GATE signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction

function s=spn_xor(x)
  s=((1-x(1))*x(2))+(x(1)*(1-x(2)));
  for i=3:length(x)
    s=((1-s)*x(i))+(s*(1-x(i)));
  endfor
  fprintf("XOR GATE signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction

function s=spn_nand(x)
  s=x(1)*x(2);
  for i=3:length(x)
    s=s*x(i);
  endfor
  s=1-s;
  fprintf("NAND GATE signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction

function s=spn_nor(x)
  s=(x(1)*x(2))+(x(1)*(1-x(2)))+((1-x(1))*x(2));
  for i=3:length(x)
    s=(s*x(i))+(s*(1-x(i)))+((1-s)*x(i));
  endfor
  s= 1-s;
  fprintf("NOR GATE signal probabiliti: %f \n",s);
  SwitchingActivity(s);
endfunction

function esw= SwitchingActivity(s)
  esw= 2*s*(1-s);
  fprintf("TO SWITCHING ACTIVITY THS PYLHS EINAI: %f \n" , esw);
endfunction
