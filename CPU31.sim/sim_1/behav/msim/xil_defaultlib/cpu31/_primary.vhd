library verilog;
use verilog.vl_types.all;
entity cpu31 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        inst            : in     vl_logic_vector(31 downto 0);
        rdata           : in     vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(31 downto 0);
        dataout         : out    vl_logic_vector(31 downto 0);
        imr             : out    vl_logic;
        dmr             : out    vl_logic;
        dmw             : out    vl_logic;
        dm_cs           : out    vl_logic;
        addr            : out    vl_logic_vector(31 downto 0)
    );
end cpu31;
