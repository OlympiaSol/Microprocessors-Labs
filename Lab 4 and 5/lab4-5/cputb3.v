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
    for(i=0;i<16;i=i+1)
    begin
      cpuinst.regfileinst.R[i] = 0;
    end   
    //memory address: instruction
    i=0;  cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b00000000};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b00000001};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b00000010};   //2: R2=2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R3, 8'b00000011};   //3: R3=3;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R4, 8'b00000100};   //4: R4=4;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R5, 8'b00000101};   //5: R5=5;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R6, 8'b00000110};   //6: R6=6;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R7, 8'b00000111};   //7: R7=7;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R8, 8'b00001000};   //8: R8=8;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R9, 8'b00001001};   //9: R9=9;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R10, 8'b00001010};  //10: R10=10;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R11, 8'b00001011};  //11: R11=11;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R12, 8'b00001100};  //12: R12=12;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R13, 8'b00001101};  //13: R13=13;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R14, 8'b00001110};  //14: R14=14;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R15, 8'b00001111};  //15: R15=15;                                                                           
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R0, R1, 4'b0000};            //  3: R1=R0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R1, R2, 4'b0000};            //  4: R1=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R2, R0, R1};                 //  5: R2=R0+R1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R2, 8'b00010100};   //  6:mem[20]=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R3, 8'b00010100};  //  7:R3=mem[20];
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R0, R0, R0};                 //  8:R0=R0+R0
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R2, R1, R0};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R4, R3, R2};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R5, R4, R3};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSL, R6, R5, R4};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R7, R3, R1};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R8, R7, R2};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_OR, R9, R1, R0};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSR, R10, R9, R5};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R11, R7, R0};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSL, R12, R11, R4};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R13, R8, R5};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LSR, R14, R13, R12};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_OR, R15, R14, R13};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2, 8'b00010101};
    
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
