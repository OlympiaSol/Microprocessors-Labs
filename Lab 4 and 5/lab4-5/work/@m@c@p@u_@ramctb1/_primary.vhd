library verilog;
use verilog.vl_types.all;
entity MCPU_Ramctb1 is
    generic(
        WORD_SIZE       : vl_notype;
        ADDR_WIDTH      : vl_notype;
        RAM_SIZE        : vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WORD_SIZE : constant is 3;
    attribute mti_svvh_generic_type of ADDR_WIDTH : constant is 3;
    attribute mti_svvh_generic_type of RAM_SIZE : constant is 3;
end MCPU_Ramctb1;
