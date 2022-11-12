library verilog;
use verilog.vl_types.all;
entity ext5 is
    port(
        datain          : in     vl_logic_vector(4 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        rst             : in     vl_logic
    );
end ext5;
