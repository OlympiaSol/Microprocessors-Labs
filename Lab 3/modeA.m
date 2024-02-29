
function [top_inputs,signals_alphabetical,signals_Table,ElementsTable]  = modeA(filename)


  signals_Table = [];
  ElementsTable = {}
  fid=fopen(filename);
  tline = fgetl(fid);
  first_line = strsplit(tline,' ');
  B = first_line{1,1};
  top_inputs = first_line(2:length(first_line));
  signals_alphabetical = top_inputs
  tline = fgetl(fid)

  el_i=1;
  while ischar(tline)

    tline_args = strsplit(tline,' ');
    another_signals = setdiff(tline_args(2:length(tline_args)),signals_alphabetical)
    signals_alphabetical = [signals_alphabetical, another_signals];
    indexes = [];
    for i=2:length(tline_args)

      indexes(i-1)= findIndex(signals_alphabetical,tline_args(1,i));
    endfor

      el = Element();
      el.Type = tline_args{1,1};
      el.output = indexes(1);
      el.inputs = indexes(2:length(indexes));
      ElementsTable{1,el_i}=el;
      el_i = el_i+1;

     tline =fgetl(fid);

    end
    signals_Table = zeros([1 length(signals_alphabetical)]);

endfunction




