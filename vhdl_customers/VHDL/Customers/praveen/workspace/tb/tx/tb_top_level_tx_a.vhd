library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture tb_top_level_tx_a of tb_top_level_tx_e is

    component top_level_tx_e is
        port (
            clk_i       : in std_logic;
            rst_i       : in std_logic;
            morse_i     : in std_logic;
            serial_o	: out std_logic
        );
    end component top_level_tx_e;

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

    signal morse_s : std_logic;
    signal serial_s : std_logic;

begin

	uut : signal_generator_e port map (clk_s, rst_s, dotl_s, dots_s, dashl_s, dashs_s);
    tx_uut : top_level_tx_e port map (clk_s, rst_s, morse_s, serial_s);


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

	pr_p : process
	begin
		morse_s <= '0';
		wait until falling_edge(dots_s);
		wait until falling_edge(dots_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dash
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);
		
		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dash
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dash
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dot
		morse_s <= '1';
		wait until falling_edge(dots_s);
		morse_s <= '0';
		wait until falling_edge(dots_s);

		-- Wait for 1 dot signal
		wait until falling_edge(dots_s);

		-- dash
		morse_s <= '1';
		wait until falling_edge(dashs_s);
		morse_s <= '0';
		wait until falling_edge(dashs_s);


		wait;	
	end process pr_p;

end tb_top_level_tx_a;