library verilog;
use verilog.vl_types.all;
entity Asynchronous_D_FF is
    port(
        CLK             : in     vl_logic;
        D               : in     vl_logic;
        RST_n           : in     vl_logic;
        ena             : in     vl_logic;
        Q1              : out    vl_logic;
        Q2              : out    vl_logic
    );
end Asynchronous_D_FF;
