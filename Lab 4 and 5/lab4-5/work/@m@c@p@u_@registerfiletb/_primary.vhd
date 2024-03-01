library verilog;
use verilog.vl_types.all;
entity MCPU_Registerfiletb is
    generic(
        WORD_SIZE       : vl_notype;
        OPERAND_SIZE    : vl_notype;
        REGISTERS_NUMBER: vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORD_SIZE : constant is 3;
    attribute mti_svvh_generic_type of OPERAND_SIZE : constant is 3;
    attribute mti_svvh_generic_type of REGISTERS_NUMBER : constant is 3;
end MCPU_Registerfiletb;
