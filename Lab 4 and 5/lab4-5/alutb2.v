module MCPU_Alutb2();

parameter CMD_SIZE=2;
parameter WORD_SIZE=8;//8 bits

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE*2-1:0] out;
wire OVERFLOW;

///gia to always block arxikopoihseis
reg iscorrect;
reg [WORD_SIZE-1:0]temp1;
reg [WORD_SIZE-1:0]temp2;
reg [CMD_SIZE-1:0]tempopcode;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);
///always block
always begin
  #2
  if(tempopcode[1]==0)begin
    if (tempopcode[0]==0)begin
      if(out[WORD_SIZE-1:0]==(temp1&temp2))//gia and
        iscorrect=1;
      else
        iscorrect=0;
    end else begin//OR
      if(out[WORD_SIZE-1:0]==(temp1|temp2))//gia or
        iscorrect=1;
      else
        iscorrect=0;
    end
  end else begin
    if (tempopcode[0]==0)begin
      if(out[WORD_SIZE-1:0]==(temp1^temp2))//gia xor
        iscorrect=1;
      else
        iscorrect=0;
    end else begin
    
      if({OVERFLOW,out[WORD_SIZE-1:0]}==(temp1+temp2))//gia add
        iscorrect=1;
      else
        iscorrect=0;
    end
  end

  temp1=r1;
  temp2=r2;
  tempopcode=opcode;
end

// Testbench code goes here
always  
begin 
#2 r1 = 4; #2 r1 = 8; #2 r1 = 1; #2 r1 = 2; 
end 
always  
begin  
#2 r2 = 4; #2 r2 = 8; #2 r2 = 1; #2 r2 = 2; 
end 

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end


endmodule

