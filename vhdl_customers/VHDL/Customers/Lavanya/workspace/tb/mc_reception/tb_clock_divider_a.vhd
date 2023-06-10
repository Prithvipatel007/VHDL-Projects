LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ARCHITECTURE tb_clock_divider_a OF tb_clock_divider_e IS

COMPONENT clock_divider_e IS
    PORT(
        clk_i       :   IN STD_LOGIC;
        rst_i       :   IN STD_LOGIC;
        q4Hz_o      :   OUT STD_LOGIC;
        co4Hz_o     :   OUT STD_LOGIC;
        q2Hz_o      :   OUT STD_LOGIC;
        co2Hz_o     :   OUT STD_LOGIC
    );
END COMPONENT clock_divider_e;

SIGNAL clk_s    :   STD_LOGIC;
SIGNAL rst_s    :   STD_LOGIC;
SIGNAL q4Hz_s    :   STD_LOGIC;
SIGNAL co4Hz_s    :   STD_LOGIC;
SIGNAL q2Hz_s    :   STD_LOGIC;
SIGNAL co2Hz_s    :   STD_LOGIC;

BEGIN

uut : clock_divider_e PORT MAP (clk_s, rst_s, q4Hz_s, co4Hz_s, q2Hz_s, co2Hz_s);

clocked : PROCESS
BEGIN

    clk_s <= '1';
    WAIT FOR 41.5 ns;
    clk_s <= '0';
    WAIT FOR 41.5 ns;

END PROCESS clocked;

reset : PROCESS
BEGIN
    rst_s <= '0';
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    WAIT UNTIL rising_edge(clk_s);
    rst_s <= '1';
    WAIT;
END PROCESS reset;

END tb_clock_divider_a;