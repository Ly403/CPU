library verilog;
use verilog.vl_types.all;
entity dec is
    port(
        code            : in     vl_logic_vector(31 downto 0);
        instruction     : out    vl_logic_vector(31 downto 0)
    );
end dec;
