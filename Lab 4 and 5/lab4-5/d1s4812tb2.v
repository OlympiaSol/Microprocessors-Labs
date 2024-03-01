
module d1s4812tb2();

//input registers to our instantiated module
reg tb_a;
reg tb_b;
reg tb_c;
reg d_correct;
  
//bus for witing data to the inputs
wire [2:0] tb_dut_inputs;
  
//wire for reading the output of theinstantiatd module
wire tb_d;
  
//this is the instantiated module examle1
//the name of the instance is dut
d1s4812 dut(tb_a,tb_b,tb_c,tb_d);

//now we create the bus that consists of the three input registers values
assign tb_dut_inputs = {tb_a, tb_b, tb_c};
 
//this block is running only at the beggining of the simulation
initial begin
  {tb_a, tb_b, tb_c}=3'b000;
  //the following line runs forever every 5 time units
  forever #5 {tb_a,tb_b,tb_c}=tb_dut_inputs+1;
end //initial begin 

always #2
if(((tb_a & tb_b)&(!tb_c)) == tb_d)
begin
  d_correct <= 1'b1;
end
else begin
  d_correct <= 1'b0;
end

endmodule


