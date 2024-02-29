function s = SpByType(type, varargin)

  # Convert cell array varargin to a matrix
  inputs = cell2mat(varargin);

  # Select the appropriate gate function based on the gate type
  if strcmp(type, "AND")
    s = spAND(inputs);

  endif

  if strcmp(type, "OR")
    s = spOR(inputs);

  endif

  if strcmp(type, "XOR")
    s = spXOR(inputs);

  endif

  if strcmp(type, "NOT")
    s = spNOT(varargin);

  endif

  if strcmp(type, "XNOR")
    s = spXNOR(varargin);

  endif

  if strcmp(type, "NOR")
    s = spNOR(varargin);

  endif

  if strcmp(type, "NAND")
    s = spNAND(varargin);
  endif

endfunction

# Calculate switching probability for NOT gate
function s = spNOT(varargin)
  Ninputsp = cell2mat(varargin);
  s = 1 - Ninputsp{1,1};
  printf("NOT gate for input %d\n", Ninputsp{1,1});
  s
  printf("\n");
endfunction

# Calculate switching probability for AND gate
function s = spAND(varargin)
  s = 1;
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  for i = 1:N
    s = s * Ninputsp(i);
  endfor
  printf("AND gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for AND %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate switching probability for OR gate
function s = spOR(varargin)
  s = 1;
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  for i = 1:N
    s = s * (1 - Ninputsp(i));
  endfor
  s = 1 - s;
  printf("OR gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for OR %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate switching probability for XOR gate
function s = spXOR(varargin)
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  lastXor2prob = 100;
  for i = 1:N-1
    if lastXor2prob == 100
      lastXor2prob = Ninputsp(i) * (1 - Ninputsp(i+1)) + (1 - Ninputsp(i)) * Ninputsp(i+1);
    else
      lastXor2prob = lastXor2prob * (1 - Ninputsp(i+1)) + (1 - lastXor2prob) * Ninputsp(i+1);
    end
  endfor
  s = lastXor2prob;
  printf("XOR gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for XOR %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate switching probability for XNOR gate
function s = spXNOR(varargin)
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  lastXor2prob = 100;
  for i = 1:N-1
    if lastXor2prob == 100
      lastXor2prob = Ninputsp(i) * (1 - Ninputsp(i+1)) + (1 - Ninputsp(i)) * Ninputsp(i+1);
    else
      lastXor2prob = lastXor2prob * (1 - Ninputsp(i+1)) + (1 - lastXor2prob) * Ninputsp(i+1);
    end
  endfor
  s = 1 - lastXor2prob;
  printf("XNOR gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for XOR %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate switching probability for NAND gate
function s = spNAND(varargin)
  s = 1;
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  for i = 1:N
    s = s * Ninputsp(i);
  endfor
  s = 1 - s;
  printf("NAND gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for NAND %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate switching probability for NOR gate
function s = spNOR(varargin)
  s = 1;
  Ninputsp = cell2mat(varargin);
  N = length(Ninputsp);
  for i = 1:N
    s = s * (1 - Ninputsp(i));
  endfor

  printf("NOR gate for %d input probabilities ", N);
  s1 = "";
  for i = 1:N
    if i == 1
      open_token = "(";
      s1 = num2str(Ninputsp(1));
      s1 = strcat(open_token, s1);
    else
      s2 = strcat(",", num2str(Ninputsp(i)));
      s1 = strcat(s1, s2);
    end
  endfor
  close_token = ")";
  s3 = ": \n";
  s1 = strcat(s1, close_token);
  s1 = strcat(s1, s3);
  printf(s1);
  s
  printf("Switching activity for NOR %d - Gate = %f\n", N, switchingActivity(s));
  printf("\n");
endfunction

# Calculate the switching activity for a gate
function E = switchingActivity(p)
  E = 2 * p * (1 - p);
endfunction

