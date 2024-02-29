function ret = findIndex(alpha_lista, ch)
  # Find the index of the specified element 'ch' in the cell array 'alpha_lista'
  N = length(alpha_lista);

  for i = 1:N
    # Check if the current element matches the target element 'ch'
    if strcmp(alpha_lista{1, i}, ch)
      ret = i;  # Set the index and exit the loop
      break
    endif
  endfor
endfunction

