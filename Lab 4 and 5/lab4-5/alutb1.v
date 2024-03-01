module MCPU_Alutb1();

parameter CMD_SIZE=2;
parameter WORD_SIZE=2;// 2 bits to afinoume

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE*2-1:0] out;
wire OVERFLOW;

///gia to always block arxikopoihseis
//Initialize my temporary registers and register iscorrect
reg iscorrect;
reg [WORD_SIZE-1:0]temp1;
reg [WORD_SIZE-1:0]temp2;
reg [CMD_SIZE-1:0]tempopcode;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);
///always block
//temp_opcode=00 2 dits
always begin
  #2//temp_opcode[1] = 0 : we have "and" (00) and "or" (01) procedures.
  if(tempopcode[1]==0)begin
    if (tempopcode[0]==0)begin
      if(out[WORD_SIZE-1:0]==(temp1&temp2))//AND(00): out(word_size) = r1 and r2
        iscorrect=1;
      else
        iscorrect=0;
    end else begin//OR
      if(out[WORD_SIZE-1:0]==(temp1|temp2))//OR(01): out(word_size) = r1 or r2
        iscorrect=1;
      else
        iscorrect=0;
    end
  end else begin//temp_opcode[1] = 1 : we have "xor" (10) and "add" (11) procedures.
    if (tempopcode[0]==0)begin
      if(out[WORD_SIZE-1:0]==(temp1^temp2))//XOR(10): out(word_size) = r1 xor r2
        iscorrect=1;
      else
        iscorrect=0;
    end else begin
    
      if({OVERFLOW,out[WORD_SIZE-1:0]}==(temp1+temp2))//ADD: 11 -> here we dont only need the word_size of the output but also the overflow (gia ta kratoumena)
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
always #2 r1[0] = $random;
always #2 r2[0] = $random;
always #2 r1[1] = $random;
always #2 r2[1] = $random;

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end


endmodule


