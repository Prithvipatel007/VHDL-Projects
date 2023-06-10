LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ARCHITECTURE tb_morse_decoder_a OF tb_morse_decoder_e IS
	
	COMPONENT morse_decoder_e IS
		PORT (
			clk_i       : IN STD_LOGIC;
			rst_i       : IN STD_LOGIC;
			mc_i        : IN STD_LOGIC;
			dot_i       : IN STD_LOGIC;
			dash_i      : IN STD_LOGIC;
			char_ascii_o: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			char_dv_o   : OUT STD_LOGIC
		);
	END COMPONENT morse_decoder_e;
	
	SIGNAL clk_s       : STD_LOGIC;
	SIGNAL rst_s       : STD_LOGIC;
	SIGNAL mc_s        : STD_LOGIC;
	SIGNAL dot_s       : STD_LOGIC;
	SIGNAL dash_s      : STD_LOGIC;
	SIGNAL char_ascii_s:  STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL char_dv_s   :  STD_LOGIC;
	
BEGIN
	
	uut : morse_decoder_e PORT MAP (clk_s, rst_s, mc_s, dot_s, dash_s, char_ascii_s, char_dv_s);

	clocked : PROCESS 
	BEGIN
		clk_s <= '1';
		WAIT for 41.5 ns;
		clk_s <= '0';
		WAIT for 41.5 ns;
	END PROCESS clocked;

	reset : PROCESS 
	BEGIN
		rst_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		rst_s <= '1';
		WAIT;
	END PROCESS reset;

	dot_process : PROCESS 
	BEGIN
		dot_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		dot_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
		WAIT UNTIL rising_edge(clk_s);
	END PROCESS dot_process;

	dash_process : PROCESS
	BEGIN
		dash_s <= '1';
		WAIT UNTIL rising_edge(clk_s);
		dash_s <= '0';
		WAIT UNTIL rising_edge(clk_s);
		for I in 0 to 1 loop
			WAIT UNTIL rising_edge(clk_s);
			WAIT UNTIL rising_edge(clk_s);
			WAIT UNTIL rising_edge(clk_s);
			WAIT UNTIL rising_edge(clk_s);
			WAIT UNTIL rising_edge(clk_s);
		end loop;
	END PROCESS dash_process;

	input_process : PROCESS
	BEGIN
		mc_s <= '0';
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		
		-- 11
		mc_s <= '1';
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '1';
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dot_s);


		WAIT UNTIL falling_edge(dash_s);

		-- 00
		mc_s <= '1';
		WAIT UNTIL falling_edge(dash_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dash_s);
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '1';
		WAIT UNTIL falling_edge(dash_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dash_s);

		-- 11
		mc_s <= '1';
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dot_s);
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '1';
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dot_s);


		WAIT UNTIL falling_edge(dash_s);

		-- 00
		mc_s <= '1';
		WAIT UNTIL falling_edge(dash_s);
		mc_s <= '0';
		WAIT UNTIL falling_edge(dash_s);
		WAIT UNTIL falling_edge(dot_s);
		mc_s <= '1';
		WAIT UNTIL falling_edge(dash_s);
		mc_s <= '0';

		WAIT;		
	END PROCESS input_process;
	
END tb_morse_decoder_a;