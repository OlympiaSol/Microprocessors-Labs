module MCPUtb();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1;
end

/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter [cpuinst.OPERAND_SIZE-1:0] R0 = 0;
parameter [cpuinst.OPERAND_SIZE-1:0] R1 = 1;
parameter [cpuinst.OPERAND_SIZE-1:0] R2 = 2;
parameter [cpuinst.OPERAND_SIZE-1:0] R3 = 3;
parameter [cpuinst.OPERAND_SIZE-1:0] R4 = 4;
parameter [cpuinst.OPERAND_SIZE-1:0] R5 = 5;
parameter [cpuinst.OPERAND_SIZE-1:0] R6 = 6;
parameter [cpuinst.OPERAND_SIZE-1:0] R7 = 7;
parameter [cpuinst.OPERAND_SIZE-1:0] R8 = 8;
parameter [cpuinst.OPERAND_SIZE-1:0] R9 = 9;
parameter [cpuinst.OPERAND_SIZE-1:0] R10 = 10;
parameter [cpuinst.OPERAND_SIZE-1:0] R11 = 11;
parameter [cpuinst.OPERAND_SIZE-1:0] R12 = 12;
parameter [cpuinst.OPERAND_SIZE-1:0] R13 = 13;
parameter [cpuinst.OPERAND_SIZE-1:0] R14 = 14;
parameter [cpuinst.OPERAND_SIZE-1:0] R15 = 15;

initial
begin
    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end
                                                                                                 //memory address: instructi                                                            
    cpuinst.regfileinst.R[1] = 16'b0001001011001100;                                          	 //R1=4812
    i=0;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b00000001};   	                 //0:R2=1  
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2,  8'b00001001};           		             //1:check while n!=1
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R15, R1, R2};                		             //2:check n odd or not
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R15, 8'b00000110};           		             //3:if yes go to 6
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSR, R1, R1,  R2};                		             //4:if not then n=n/2
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2,  8'b00001001};           		             //5:go to 9
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSL, R5,  R1,  R2};               		             //6:R5=2*n
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R6,  R5,  R1};               		             //7:R6=2*n+n=3n
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R1,  R6,  R2};               		             //8:n=3n+1
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R14, R1,  R2};               		             //9:check while(n!=1)
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R14, 8'b00000010};           		             //10:n is not 1 so continue
   
    
    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
end

endmodule



