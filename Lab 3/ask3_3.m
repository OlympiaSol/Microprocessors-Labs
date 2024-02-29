#kwdikas gia diataksh stoixeiwn me tropo pou na antistoixei sthn seira logikhs leitourgias
#ta sroixeia pou eksartiountai apo alla tha mpoun ston pinaka meta ta stoixeia pou ta elegxoun



function  [top_inputs,signals_alphabetical,signals_Table,ElementsTableSorted] = ask3_3(filename)

  [top_inputs,signals_alphabetical,signals_Table,ElementsTable] = ask3_2(filename); #kalei thn ask3_2 gia na parei ta dedomena


  ElementsTableSorted={}; #apothikeuei ta taksinomhmena stoixeia
  printf("Elements Table processing :\n")
  k=1;
  top_inputs_pins = top_inputs; #arxikh lista eisodwn
  while length(top_inputs_pins)!=length(signals_alphabetical)

    for i=1:length(ElementsTable) #elegxontai an oi eisodoi tou stoixeiou anhkoun sto top_inputs_pins
                                  #kai an oxi, prosthetei to stoixeio ston ElementsTableSorted



        el = ElementsTable{1,i};
        if isempty(el)!=1
          inputs_of_el = el.inputs;
          if inputsAreTopInputs(el.inputs,top_inputs_pins,signals_alphabetical)==1
            ElementsTableSorted{1,k}= el;
            if existsInTopInputs(el.output(1),top_inputs_pins,signals_alphabetical)==0
                top_inputs_pins{1,length(top_inputs_pins)+1}= signals_alphabetical{1,el.output(1)};  #enhmerwsh
            endif
            ElementsTable{1,i}={};
            k=k+1;
          endif
        endif

    endfor

  end


endfunction


#elegxei an oles oi oi eisodoi anhkoun sta top_inputs_lista. an nai, epistrefei 1, an oxi epistrefei 0
function [ret] = inputsAreTopInputs(inputs_gate,top_inputs_lista,signals_alpha)

  flag=0;
  for j=1:length(inputs_gate)

    for k=1:length(top_inputs_lista)

      if(strcmp(signals_alpha(inputs_gate(j)),top_inputs_lista(k)))
        flag=flag+1;
        break
      endif

    endfor

  endfor
  if flag==length(inputs_gate)

    ret=1;
  else
    ret=0;

  end


endfunction




#elegxei an to shma signals_alpha{1,out} einai sta eisagwmena shmata top_inputs_lista, an nai epistrefei 1, an oxi epistrefei 0
function [ret] = existsInTopInputs(out,top_inputs_lista,signals_alpha)

  for i=1:length(top_inputs_lista)

    if strcmp(signals_alpha{1,out},top_inputs_lista{1,i})==1
      ret=1;
      return

    end

  endfor
  ret=0;

endfunction
