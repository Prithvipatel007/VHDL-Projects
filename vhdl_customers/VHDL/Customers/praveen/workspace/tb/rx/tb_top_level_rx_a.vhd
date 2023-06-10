library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture tb_top_level_rx_a of tb_top_level_rx_e is

    component top_level_rx_e is
        port (
            clk_i       : in std_logic;
            rst_i       : in std_logic;
            rx_i        : in std_logic;
            morse_o     : out std_logic
        );
    end component top_level_rx_e;

    signal clk_s : std_logic;
    signal rst_s : std_logic;
    signal rx_s : std_logic;
    signal morse_s : std_logic;

begin

    rx_uut : top_level_rx_e port map (clk_s, rst_s, rx_s, morse_s);

    clocking : process
    begin
        clk_s <= '1';
		wait for 41.5 ns;
		clk_s <= '0';
		wait for 41.5 ns;
    end process clocking;

    reseting : process
    begin
        rst_s <= '0';
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        rst_s <= '1';
        wait;
    end process reseting;

    rxd_process : PROCESS
		BEGIN
		rx_s <= '0';	
		wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);
        wait until rising_edge(clk_s);

		rx_s <= '1';
		WAIT FOR 104 us;  
		rx_s <= '0';	
		WAIT FOR 104 us;
		
		rx_s <= '1';
		WAIT FOR 104 us;
		rx_s <= '1';
		WAIT FOR 104 us;
		rx_s <= '0';
		WAIT FOR 104 us;
		rx_s <= '0';
		WAIT FOR 104 us;
		rx_s <= '1';
		WAIT FOR 104 us;
		rx_s <= '1';
		WAIT FOR 104 us;
		rx_s <= '0';
		WAIT FOR 104 us;
		rx_s <= '0';
		WAIT FOR 104 us;
		
		rx_s <= '1';
		WAIT FOR 104 us;
		rx_s <= '1';
		WAIT FOR 104 us;

		wait;

	END PROCESS rxd_process;



end tb_top_level_rx_a;