library verilog;
use verilog.vl_types.all;
entity ext is
    generic(
        ZERO            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        SIGN            : vl_logic_vector(0 to 1) := (Hi0, Hi1)
    );
    port(
        imm16           : in     vl_logic_vector(15 downto 0);
        imm32           : out    vl_logic_vector(31 downto 0);
        ext             : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ZERO : constant is 1;
    attribute mti_svvh_generic_type of SIGN : constant is 1;
end ext;
