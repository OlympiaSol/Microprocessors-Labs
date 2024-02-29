function [top_inputs, signals_alphabetical, signals_Table, ElementsTable] = modeB(filename)

  # Initialize variables for storing signals and elements
  signals_Table = [];
  ElementsTable = {};

  # Initialize lists for storing inputs
  not_top_inputs = {};
  top_inputs = {};

  circuit = fopen(filename);
  l = fgetl(circuit);
  i = 0;
  k = 0;

  # Read each line of the file
  while ischar(l)
    l = strsplit(l, ' ');
    not_top_inputs(i+1) = l{1, 2};
    l(2:length(l));
    top_inputs(k+1:k+1+length(l)-2) = l(2:length(l));

    i = i + 1;
    k = k + length(l) - 2 + 1;
    l = fgetl(circuit);
  end

  # Calculate top_inputs by excluding not_top_inputs
  top_inputs = setdiff(top_inputs, not_top_inputs);
  signals_alphabetical = top_inputs;
  fclose(circuit);

  circuit = fopen(filename);
  tline = fgetl(circuit);
  el_i = 1;

  # Read each line of the file to build ElementsTable
  while ischar(tline)
    tline_args = strsplit(tline, ' ');
    another_signals = setdiff(tline_args(2:length(tline_args)), signals_alphabetical);
    signals_alphabetical = [signals_alphabetical, another_signals];
    indexes = [];

    # Calculate indexes of input signals
    for i = 2:length(tline_args)
      indexes(i-1) = findIndex(signals_alphabetical, tline_args(1, i));
    endfor

    # Create a new Element object and populate its fields
    el = Element();
    el.Type = tline_args{1, 1};
    el.output = indexes(1);
    el.inputs = indexes(2:length(indexes));
    ElementsTable{1, el_i} = el;
    el_i = el_i + 1;

    tline = fgetl(circuit); # Read the next line
  end

  # Initialize signals_Table with zeros
  signals_Table = zeros([1 length(signals_alphabetical)]);
endfunction

