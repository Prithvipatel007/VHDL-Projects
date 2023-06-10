LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY tb_register_input IS

END tb_register_input;

ARCHITECTURE arch of tb_register_input IS 
	COMPONENT register_input IS 
		PORT(
			rb_i     : IN STD_LOGIC;
			cp_i     : IN STD_LOGIC;
			sp_i     : IN STD_LOGIC;
			lp_i 	: IN STD_LOGIC;
			dv_i   : IN STD_LOGIC;
			in1_o     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			in2_o   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
			inv_o     : OUT STD_LOGIC;
			showLed	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT register_input;
	
	SIGNAL rb_s     : STD_LOGIC;
	SIGNAL cp_s     : STD_LOGIC;
	SIGNAL sp_s     : STD_LOGIC;
	SIGNAL lp_s 	: STD_LOGIC;
	SIGNAL dv_s   	:  STD_LOGIC;
	SIGNAL in1_s    : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL in2_s   : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL inv_s     : STD_LOGIC;
	SIGNAL showLed	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
	dut : entity work.register_input
	port map(rb_s, cp_s, sp_s, lp_s, dv_s, 
		in1_s, in2_s, inv_s, showLed);

	clocked : PROCESS 
	BEGIN
		cp_s <= '1';
		WAIT FOR 10 ns;
		cp_s <= '0';
		WAIT FOR 10 ns;
	END PROCESS clocked;
	
	stimuli : PROCESS
	BEGIN
		rb_s <= '0';
		sp_s <= '0';
		lp_s <= '0';
		dv_s <= '0';
		WAIT UNTIL rising_edge(cp_s);
		WAIT UNTIL rising_edge(cp_s);
		WAIT UNTIL rising_edge(cp_s);
		rb_s <= '1';
		for i in 0 to 32 loop
			WAIT UNTIL rising_edge(cp_s);
			WAIT UNTIL rising_edge(cp_s);
			WAIT UNTIL rising_edge(cp_s);
			WAIT UNTIL rising_edge(cp_s);
			WAIT UNTIL rising_edge(cp_s);
			sp_s <= '1';
			lp_s <= '0';
			dv_s <= '1';
			WAIT UNTIL rising_edge(cp_s);
			sp_s <= '0';
			lp_s <= '0';
			dv_s <= '0';
		end loop;
		
		WAIT;	
	END PROCESS stimuli;

END arch;
