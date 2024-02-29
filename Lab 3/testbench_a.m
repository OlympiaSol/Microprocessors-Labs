# Testbench based on the ask3_1 function

# Suppress all warnings
warning('off', 'all');

# Define possible combinations of inputs (Truth table)
Truth_table = [0, 0, 0; 0, 0, 1; 0, 1, 0; 0, 1, 1; 1, 0, 0; 1, 0, 1; 1, 1, 0; 1, 1, 1];

# Display the Truth table
printf("Truth Table:\n");
disp(Truth_table);

# Execute the function for each combination of inputs
for i = 1:length(Truth_table)
  printf("\nFor a = %d, b = %d, c = %d:\n", Truth_table(i, 1), Truth_table(i, 2), Truth_table(i, 3))

  # Call the ask3_1 function with the current input combination and display the result
  printf("Final result = %d\n", ask3_1([Truth_table(i, 1), Truth_table(i, 2), Truth_table(i, 3)]))
  printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n")
endfor

