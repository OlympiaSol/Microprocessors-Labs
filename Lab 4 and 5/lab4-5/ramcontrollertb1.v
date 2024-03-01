module MCPU_Ramctb1();
//parameters
parameter WORD_SIZE=RamController.WORD_SIZE;
parameter ADDR_WIDTH=RamController.ADDR_WIDTH;
parameter RAM_SIZE=1<<ADDR_WIDTH;
//registers
reg we, re,isconfirm;
reg [WORD_SIZE-1:0] datawr;
reg [ADDR_WIDTH-1:0] addr;
reg [ADDR_WIDTH-1:0] instraddr;
reg [WORD_SIZE-1:0] mymem[RAM_SIZE-1:0];
reg [WORD_SIZE-1:0] word;
//wires
wire [WORD_SIZE-1:0] datard;
wire [WORD_SIZE-1:0] instrrd;
//component
MCPU_RAMController RamController (we, datawr, re, addr, datard, instraddr, instrrd);
integer i;

//testbench
initial begin
  we=1; //gia na grapsei (we = 1)
  for (i=0;i<RAM_SIZE;i=i+1)begin
    #2
      //gia to megethos thn Ram , thn gemizoume me random bits.
      datawr=$random;//generate random word
      addr=i;//address of the random word
      #1
      mymem[addr]=datawr; //memory[address] = random word
      
  end
  #2
  //Data Read must be equal to Command Read
  //(re = 1 and we = 0 because we want no writing) 
  //if equal -> iscorrect = 1 else iscorrect = 0
  we=0;//gia na mhn grapsei
  re=1;//gia na diavasei
  for (i=0;i<RAM_SIZE;i=i+1)begin
    #2
      addr=i;//address for data read = i(dedomena)
	    instraddr = i;        //address for cmd read = i(entoles)
      #1
      word=mymem[addr];//get the word from data read
      if(word==datard)begin
        if(instrrd == mymem[i]) begin// edw exoume an h lexei pou diavasame einai idia me tin apothikevmenh sthn mnhmh kai sthn idia adress tote einai swsto
          isconfirm=1;
        end else begin
          isconfirm=0;
        end
      end
  end
end
endmodule



