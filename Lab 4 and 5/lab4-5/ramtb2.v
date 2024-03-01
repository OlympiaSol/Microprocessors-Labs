module MCPU_RAMControllertb();
parameter WORD_SIZE=14;
parameter ADDR_WIDTH=8;
parameter RAM_SIZE=1<<ADDR_WIDTH;

reg we, re;
reg [ADDR_WIDTH-1:0] addr;
reg [WORD_SIZE-1:0] datawr;

wire [WORD_SIZE-1:0] datard;
wire [WORD_SIZE-1:0] instrrd;

reg [ADDR_WIDTH-1:0] instraddr;

reg iscorrectw;
reg iscorrectr;
reg iscorrectri;

//copy
reg [WORD_SIZE-1:0] mem1[RAM_SIZE-1:0];

MCPU_RAMController #(.WORD_SIZE(WORD_SIZE),.ADDR_WIDTH(ADDR_WIDTH)) 
raminst (we, datawr, re, addr, datard, instraddr, instrrd);


///////////////WRITE////////////////
integer i;
initial begin
  //Initializations
  we <= 1'b0;
  re <= 1'b0;
  addr <= 1'b0;
  instraddr <= 1'b0;
  iscorrectw <= 1'b0;
  iscorrectr <= 1'b0;
  iscorrectri <= 1'b0;
  //Wait 2ps
  #2;
  //Starting write process - we = 1
  #2 we <= 1'b1;
  for(i = 0; i < RAM_SIZE; i = i + 1) begin
    #2 addr <= i; //Fill all the rows  of mem
    #2 datawr <= 4812; //produce random values to write
    #2 mem1[i] = datawr; //save all values that we saved to mem to mem's copy
  end
  //Now check if datawr/copyReg[i] is present in mem at addr = i
  for(i = 0; i < RAM_SIZE; i = i + 1) begin
    if(mem1[i] == raminst.mem[i]) begin
      #2 iscorrectw <= 1;
    end else begin
      #2 iscorrectw <= 0;
    end
  end
  //Starting read process - re = 1
  #2 we <= 1'b0; //disable write
  for(i = 0; i < RAM_SIZE; i = i + 1) begin
    #2 addr <= i;
    #2 re <= 1'b1; //enable read
    if(datard == mem1[i]) begin //check if datard is equal to the copy of mem
      #2 iscorrectr <= 1;
    end else begin
      #2 iscorrectr <= 0;
    end
  end
  //Starting read instruction process
  #2 re <= 1'b0; //disable read
  for(i = 1; i < RAM_SIZE+1; i = i + 1) begin
    #2 instraddr <= i;
    if(instrrd == mem1[i-1]) begin //check if instrrd is equal to the copy of mem
      #2 iscorrectri <= 1;
    end else begin
      #2 iscorrectri <= 0;
    end
  end
end
endmodule








