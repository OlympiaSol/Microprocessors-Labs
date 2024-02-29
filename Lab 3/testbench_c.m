#Average switching with switching propability
#ypothetoume oti h eisodos allazei me sygkekrimenh pithanohthta


[top_inputs,signals_alphabetical,signals_Table,ElementsTable] = ask3_3('circuit3.txt'); #kaleitai h ask3_3 gia na paroume tous pinakes ths

for i=1:length(signals_alphabetical)

    for j=1:length(top_inputs)

      if(strcmp(signals_alphabetical{1,i},top_inputs{1,j}))

        signals_Table(i)=0.4051; # kathe eisodos allazei thn katastash ths me pithanohthta 40.51%
      endif
    endfor

endfor


for j=1:length(ElementsTable)

  el = ElementsTable{1,j};
  el.output(1);
  el.Type;
  sig_inputs = [];
  for k=1:length(el.inputs)
    sig_inputs(k) = signals_Table(el.inputs(k));
  endfor
  new_value_signal = SpByType(el.Type,sig_inputs);
  signals_Table(el.output(1))= new_value_signal;
endfor


