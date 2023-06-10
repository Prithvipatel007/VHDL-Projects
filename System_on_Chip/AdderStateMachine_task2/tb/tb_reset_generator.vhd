LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------

ENTITY tb_reset_generator IS
END tb_reset_generator;

ARCHITECTURE arch of tb_reset_generator IS

	COMPONENT reset_generator IS
		PORT(
			clk_12M : IN STD_LOGIC;
			clk_5s_i : IN STD_LOGIC;
			rb_o	:	OUT STD_LOGIC
		);
	END COMPONENT reset_generator;
	
	SIGNAL clk_12M_s : STD_LOGIC;
	SIGNAL clk_5s_s	:	STD_LOGIC;
	SIGNAL rb_s : STD_LOGIC;
	
BEGIN
	dut : entity work.reset_generator port map(clk_12M_s, clk_5s_s, rb_s);
	
	clocked : PROCESS
	BEGIN
		clk_12M_s <= '1';
		WAIT FOR 5 ns;
		clk_12M_s <= '0' ;
		WAIT FOR 5 ns;
	END PROCESS clocked;
	
	functioning : PROCESS
	BEGIN
		clk_5s_s <= '0';
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		WAIT UNTIL rising_edge(clk_12M_s);
		
		clk_5s_s <= '1';
		WAIT UNTIL rising_edge(clk_12M_s);
		clk_5s_s <= '0';
		
		WAIT;
	END PROCESS functioning;
	
END arch;