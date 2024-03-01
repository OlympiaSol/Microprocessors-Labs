module MCPU_Alutb();

parameter CMD_SIZE=2;
parameter WORD_SIZE=8;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
reg iscorrect;

wire [WORD_SIZE*2-1:0] out;
wire OVERFLOW;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
// Testbench code goes here
always #2 r1[0] = $random;
always #2 r2[0] = $random;
always #2 r1[1] = $random;
always #2 r2[1] = $random;
always #2 r1[2] = $random;
always #2 r2[2] = $random;
always #2 r1[3] = $random;
always #2 r2[3] = $random;
always #2 r1[4] = $random;
always #2 r2[4] = $random;
always #2 r1[5] = $random;
always #2 r2[5] = $random;
always #2 r1[6] = $random;
always #2 r2[6] = $random;
always #2 r1[7] = $random;
always #2 r2[7] = $random;


always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end


always @(opcode, r1, r2)
  if(r1&r2 == out)begin
    iscorrect <=1'b1;
  end
  else if(r1|r2 == out)begin
    iscorrect <=1'b1;
  end
  else if(r1^r2 == out)begin
    iscorrect <=1'b1;
  end
  else if(r1+r2 ==out)begin
    iscorrect <=1'b1;
  end
  else begin
    iscorrect <= 1'b0;
  end
endmodule



