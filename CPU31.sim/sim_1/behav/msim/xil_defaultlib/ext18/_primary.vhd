library verilog;
use verilog.vl_types.all;
entity ext18 is
    port(
        datain          : in     vl_logic_vector(15 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        rst             : in     vl_logic
    );
end ext18;
