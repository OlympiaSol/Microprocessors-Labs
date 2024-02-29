function ret = ask3_1(top_inputs_values)
  # Initialize Signals_table with zeros and define top_inputs
  Signals_table = zeros([1 6]);
  top_inputs = [1,2,3];

  # Populate Signals_table with values from top_inputs_values
  for i = 1:length(top_inputs)
    Signals_table(top_inputs(i)) = top_inputs_values(i);
  endfor

  # Define logic element types and create an empty ElementTables array
  ElementTypes = {"NOT","AND","NAND","NOR","OR","XOR","XNOR"};
  ElementTables = [];

  # Create three logic elements (E1, E2, E3) with specific properties
  E1 = Element();
  E1.Type = "AND"; E1.inputs = [1,2]; E1.output = [4];

  E2 = Element();
  E2.Type = "NOT"; E2.inputs = [3]; E2.output = [5];

  E3 = Element();
  E3.Type = "AND"; E3.inputs = [4,5]; E3.output = [6];

  # Store logic elements in ElementTables array
  ElementTables = {E1, E2, E3};

  # Update Signals_table based on logic elements' types and inputs
  Signals_table(E1.output(1)) = SpByType(E1.Type, [Signals_table(E1.inputs(1)), Signals_table(E1.inputs(2))]);
  Signals_table(E2.output(1)) = SpByType(E2.Type, [Signals_table(E2.inputs(1))]);
  Signals_table(E3.output(1)) = SpByType(E3.Type, [Signals_table(E3.inputs(1)), Signals_table(E3.inputs(2))]);

  # Set the output of the circuit as the final result
  ret = Signals_table(E3.output(1));
endfunction

