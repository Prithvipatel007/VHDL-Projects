library ieee;
use ieee.std_logic_1164.all;

architecture tb_signal_generator_a of tb_signal_generator_e is

component signal_generator_e is
    port(
        clk_i       :   in std_logic;
        rst_i     :   in std_logic;
        dotl_o      :   out std_logic;
        dots_o     :   out std_logic;
        dashl_o      :   out std_logic;
        dashs_o     :   out std_logic
    );
end component signal_generator_e;

signal clk_s    :   std_logic;
signal rst_s    :   std_logic;
signal dotl_s    :   std_logic;
signal dots_s    :   std_logic;
signal dashl_s    :   std_logic;
signal dashs_s    :   std_logic;

begin

uut : signal_generator_e port map (clk_s, rst_s, dotl_s, dots_s, dashl_s, dashs_s);

clk_p : process
begin

    clk_s <= '1';
    wait for 41.5 ns;
    clk_s <= '0';
    wait for 41.5 ns;

end process clk_p;

rst_p : process
begin
    rst_s <= '0';
    wait until rising_edge(clk_s);
    wait until rising_edge(clk_s);
    wait until rising_edge(clk_s);
    wait until rising_edge(clk_s);
    wait until rising_edge(clk_s);
    rst_s <= '1';
    wait;
end process rst_p;

end tb_signal_generator_a;