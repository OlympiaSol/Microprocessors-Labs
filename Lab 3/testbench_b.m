# Read the circuit and create lists using ask3_2 function
[top_inputs, signals_alphabetical, signals_Table, elementsTable] = ask3_2('circuit2.txt');

# Initialize an array to count the switches for each output signal
switches = zeros([1 length(signals_Table)]);

# Number of Monte Carlo iterations
N = 4812; #Bikiefh AM
#N=4001 #Olympia AM

# Perform Monte Carlo simulation
for i = 1:N
  # Generate random input values for top_inputs
  top_inputs_signals = [];
  for j = 1:length(top_inputs)
    index_i = findIndex(signals_alphabetical, top_inputs(j));
    signals_Table(index_i) = round(mod(rand(), 2));
    top_inputs_signals = [top_inputs_signals, signals_Table(index_i)];
  endfor

  # Evaluate the circuit for the current input values
  for j = 1:length(elementsTable)
    el = elementsTable{1, j};
    sig_inputs = [];
    for k = 1:length(el.inputs)
      sig_inputs(k) = signals_Table(el.inputs(k));
    endfor

    new_value_signal = SpByType(el.Type, sig_inputs);

    # Check if the output signal has changed, and update the switches array accordingly
    if signals_Table(el.output(1)) != new_value_signal
      switches(el.output(1)) = switches(el.output(1)) + 1;
    endif

    signals_Table(el.output(1)) = new_value_signal;
  endfor
endfor

# Calculate the average switching activity for each output gate
switches = switches / N;

# Display the switching activity for each output gate
printf("Switching activity for output gates:\n");
for j = 1:length(elementsTable)
  el = elementsTable{1, j};
  printf("Switching activity for output %s = %f\n", signals_alphabetical{1, el.output(1)}, switches(el.output(1)));
endfor

