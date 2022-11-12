library verilog;
use verilog.vl_types.all;
entity gpr is
    port(
        write           : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ra              : in     vl_logic_vector(4 downto 0);
        rb              : in     vl_logic_vector(4 downto 0);
        rw              : in     vl_logic_vector(4 downto 0);
        busW            : in     vl_logic_vector(31 downto 0);
        busA            : out    vl_logic_vector(31 downto 0);
        busB            : out    vl_logic_vector(31 downto 0);
        Datain          : out    vl_logic_vector(31 downto 0)
    );
end gpr;
