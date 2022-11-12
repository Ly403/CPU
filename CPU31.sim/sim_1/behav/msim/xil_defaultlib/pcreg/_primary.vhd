library verilog;
use verilog.vl_types.all;
entity pcreg is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ena             : in     vl_logic;
        data_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
end pcreg;
