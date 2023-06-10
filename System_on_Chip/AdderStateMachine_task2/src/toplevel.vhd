LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
-----------------------------------------------------------------------------------------

ENTITY toplevel IS
	PORT(
		clk_12M	:	IN STD_LOGIC;
		rp_i	:	IN STD_LOGIC;
		led_o	:	OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END toplevel;

ARCHITECTURE arch OF toplevel IS

	COMPONENT reset_generator IS
		PORT(
			clk_12M : IN STD_LOGIC;
			clk_5s_i : IN STD_LOGIC;
			rb_o	:	OUT STD_LOGIC
		);
	END COMPONENT reset_generator;
	
	COMPONENT clk_generator IS
		PORT(
			clk_12M	:	IN STD_LOGIC;
			rb_i	:	IN STD_LOGIC;
			en_i	:	IN STD_LOGIC;
			clr_i	:	IN STD_LOGIC;
			clk_1m_o:	OUT STD_LOGIC;
			clk_2s_o:	OUT STD_LOGIC;
			clk_5s_o:	OUT STD_LOGIC
		);
	END COMPONENT clk_generator;
	
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
	
	COMPONENT adder_clk is 
		port (in_1, in_2: in std_logic_vector (7  downto 0);
				clk:in std_logic;
				rb_i: IN Std_logic;
				inv_s : in std_logic;
				out_o:out std_logic_vector (7 downto 0));
	end COMPONENT adder_clk;
	
	
	SIGNAL rb_s, en_s, clr_s, clk_1m_s, clk_2s_s, clk_5s_s : STD_LOGIC;
	SIGNAL sp_s, lp_s, dv_s	:	STD_LOGIC;
	SIGNAL in1_s, in2_s, showLed_s  : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL inv_s : STD_LOGIC;
	SIGNAL out_s : STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN
	
	clk_gen : entity work.clk_generator PORT MAP 
				(clk_12M, rb_s, en_s, clr_s, clk_1m_s, clk_2s_s, clk_5s_s);
				
	reset_gen : entity work.reset_generator PORT MAP
				(clk_12M, clk_5s_s, rb_s);
				
	filtering : entity work.debouncer PORT MAP
				(clk_12M, rb_s, clk_1m_s, clk_2s_s, clk_5s_s, rp_i, sp_s, lp_s, dv_s, en_s, clr_s);
				
	Mem	:	entity work.register_input PORT MAP
			(rb_s, clk_12M, sp_s, lp_s, dv_s, in1_s, in2_s, inv_s, showLed_s);
			
	addition : entity work.adder_clk PORT MAP
			(in1_s, in2_s, clk_12M, rb_s, inv_s, out_s);
			
	led_o <= showLed_s OR out_s;
		
END arch;