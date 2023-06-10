LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------

ENTITY tb_debouncer IS
END tb_debouncer;

ARCHITECTURE arch of tb_debouncer IS

	COMPONENT debouncer IS
		PORT(
			cp_i 		: 	IN STD_LOGIC;
			rb_i 		: 	IN STD_LOGIC;
			clk_1m_i 	: 	IN STD_LOGIC;
			clk_2s_i 	: 	IN STD_LOGIC;
			clk_5s_i 	: 	IN STD_LOGIC;
			rp_i 		: 	IN STD_LOGIC;
			sp_o		:	OUT STD_LOGIC;
			lp_o		:	OUT STD_LOGIC;
			dv_o		:	OUT STD_LOGIC;
			en_o 		: 	OUT STD_LOGIC;
			clr_o 		:	OUT STD_LOGIC
		);
	END COMPONENT debouncer;
	
	SIGNAL cp_s 		: 	STD_LOGIC;
	SIGNAL rb_s 		: 	STD_LOGIC;
	SIGNAL clk_1m_s 	: 	STD_LOGIC;
	SIGNAL clk_2s_s 	: 	STD_LOGIC;
	SIGNAL clk_5s_s 	: 	STD_LOGIC;
	SIGNAL rp_s 		: 	STD_LOGIC;
	SIGNAL sp_s			:	STD_LOGIC;
	SIGNAL lp_s			:	STD_LOGIC;
	SIGNAL dv_s			:	STD_LOGIC;
	SIGNAL clr_s		:	STD_LOGIC;
	SIGNAL en_s 		: 	STD_LOGIC;
	
BEGIN
	dut : entity work.debouncer port map(cp_s, rb_s, clk_1m_s,
				clk_2s_s, clk_5s_s,rp_s, sp_s, lp_s, dv_s, clr_s, en_s);
			
	clk_12Mhz : PROCESS
	BEGIN
		cp_s <= '1';
		WAIT FOR 5 ns;
		cp_s <= '0';
		WAIT FOR 5 ns;
	END PROCESS clk_12Mhz;
	
	clk_1KHz : PROCESS
	BEGIN
		clk_1m_s <= '0';
		WAIT FOR 100 ns;
		clk_1m_s <= '1';
		WAIT FOR 5 ns;
	END PROCESS clk_1KHz;
	
	functioning : PROCESS
	BEGIN
	
		rb_s <= '1';
		rp_s <= '1';
		clk_2s_s <= '0';
		clk_5s_s <= '0';
		WAIT UNTIL rising_edge(clk_1m_s);
		WAIT UNTIL rising_edge(clk_1m_s);
		WAIT UNTIL rising_edge(clk_1m_s);
		WAIT UNTIL rising_edge(clk_1m_s);
		WAIT UNTIL rising_edge(clk_1m_s);
		WAIT UNTIL rising_edge(clk_1m_s);
		rp_s <= '0';
		for i in 1 to 20 loop
			WAIT UNTIL rising_edge(clk_1m_s);
		end loop;
		rp_s <= '1';
		for i in 1 to 20 loop
			WAIT UNTIL rising_edge(clk_1m_s);
		end loop;
		clk_2s_s <= '1';
		WAIT UNTIL rising_edge(cp_s);
		clk_2s_s <= '0';	
		
		
		
		
		WAIT;
	END PROCESS functioning;
END arch;


















