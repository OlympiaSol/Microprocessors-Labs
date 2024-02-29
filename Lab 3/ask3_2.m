function [top_inputs, signals_alphabetical, signals_Table, ElementsTable] = ask3_2(filename)

  signals_Table = [];
  ElementTypes = {"NOT","AND","NAND","NOR","OR","XOR","XNOR"};
  ElementsTable = {};
  not_top_inputs = {};

  # Open the file specified by the filename
  fid = fopen(filename);
  circuit = fopen(filename);
  tline = fgetl(fid);  # Read the first line of the file
  first_line = strsplit(tline, ' ');  # Split the first line into cell array

  # Extract the first element of the cell array
  B = first_line{1, 1};

  # Check if the first word in the first line is 'top_inputs'
  # If true, call modeA; otherwise, call modeB
  if strfind(B, 'top_inputs')
    [top_inputs, signals_alphabetical, signals_Table, ElementsTable] = modeA(filename);
  else
    [top_inputs, signals_alphabetical, signals_Table, ElementsTable] = modeB(filename);
  end

end

