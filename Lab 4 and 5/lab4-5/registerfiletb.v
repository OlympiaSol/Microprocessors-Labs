
module MCPU_Registerfiletb();

parameter WORD_SIZE= registerFile.WORD_SIZE;
parameter OPERAND_SIZE= registerFile.OPERAND_SIZE;
parameter REGISTERS_NUMBER= registerFile.REGISTERS_NUMBER;

reg [OPERAND_SIZE-1:0] op1,op2,op3;
reg [WORD_SIZE-1:0] datatoload;
reg [1:0] regsetcmd;
reg regsetwb;

wire [WORD_SIZE-1:0] RegOp1;
wire [WORD_SIZE-1:0] alu1; // to be the first operand of alu
wire [WORD_SIZE-1:0] alu2; // to be the second operand of alu

MCPU_Registerfile registerFile(op1, op2, op3, RegOp1, alu1, alu2, datatoload, regsetwb, regsetcmd);

integer i;
initial begin
  regsetwb=0;//flag ama einai 0 den xekina na leitourgei o register
  for(i=0;i<REGISTERS_NUMBER; i=i+1)begin
    #2
    //loop gia ton kathe kataxorith apo to 0-15 , opou op1-2-3 einai eisodoi tou kataxorith kai vazoume to dataload=15
    //dld fortonoume thn timh 15(max word size) se kathe kataxorith gia na doume oti iparxei
    op1=i;
    op2=i;
    op3=i;
    datatoload=8'b00001111;//bazei to 15 giati exoume 16 theseis
    regsetcmd=00;//gia na mhn kanei load from data alla load tis times pou dino egw
    regsetwb=1;//edw xekinaei na leitourgei
  end
end

endmodule