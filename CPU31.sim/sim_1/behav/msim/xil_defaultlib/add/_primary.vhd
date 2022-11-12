library verilog;
use verilog.vl_types.all;
entity add is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        r               : out    vl_logic_vector(31 downto 0);
        overflow        : out    vl_logic;
        rst             : in     vl_logic
    );
end add;
