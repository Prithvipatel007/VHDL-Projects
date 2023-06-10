LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
-----------------------------------------------------------------------------------------

ENTITY clk_generator IS
	PORT(
		clk_12M	:	IN STD_LOGIC;
		rb_i	:	IN STD_LOGIC;
		en_i	:	IN STD_LOGIC;
		clr_i	:	IN STD_LOGIC;
		clk_1m_o:	OUT STD_LOGIC;
		clk_2s_o:	OUT STD_LOGIC;
		clk_5s_o:	OUT STD_LOGIC
	);
END clk_generator;

ARCHITECTURE arch of clk_generator IS
	
	COMPONENT c02ec IS 
		PORT(
			rb_i,cp_i,en_i,cl_i     : IN STD_LOGIC;
			q3_o,co_o               : OUT STD_LOGIC);
	END COMPONENT c02ec;
	
	COMPONENT c05ec IS 
		PORT(
			rb_i,cp_i,en_i,cl_i     : IN STD_LOGIC;
			q3_o,co_o               : OUT STD_LOGIC);
	END COMPONENT c05ec;
	
	COMPONENT c10ec IS 
		PORT(
			rb_i,cp_i,en_i,cl_i     : IN STD_LOGIC;
			q3_o,co_o               : OUT STD_LOGIC);
	END COMPONENT c10ec;
	
	COMPONENT c12ec IS 
		PORT(
			rb_i,cp_i,en_i,cl_i     : IN STD_LOGIC;
			q3_o,co_o               : OUT STD_LOGIC);
	END COMPONENT c12ec;
	
	SIGNAL q12_s, c12_s : STD_LOGIC;
	SIGNAL q100K_s, c100K_s : STD_LOGIC;
	SIGNAL q10K_s, c10K_s : STD_LOGIC;
	SIGNAL q1K_s, c1K_s : STD_LOGIC;
	SIGNAL q100_s, c100_s : STD_LOGIC;
	SIGNAL q10_s, c10_s : STD_LOGIC;
	SIGNAL q1_s, c1_s : STD_LOGIC;
	SIGNAL q2_s, c2_s : STD_LOGIC;
	SIGNAL q5_s, c5_s : STD_LOGIC;

	
BEGIN

	Divide_12 : entity work.c12ec PORT MAP(rb_i, clk_12M, en_i, clr_i, q12_s, c12_s);	-- 1 MHz
	
	Divide_10_100Khz : entity work.c10ec PORT MAP(rb_i, clk_12M, c12_s, clr_i, q100K_s, c100K_s); -- 100 KHz
	Divide_10_10Khz : entity work.c10ec PORT MAP(rb_i, clk_12M, c100K_s, clr_i, q10K_s, c10K_s); -- 10 KHz
	Divide_10_1Khz : entity work.c10ec PORT MAP(rb_i, clk_12M, c10K_s, clr_i, q1K_s, c1K_s); -- 1 KHz
	Divide_10_100hz : entity work.c10ec PORT MAP(rb_i, clk_12M, c1K_s, clr_i, q100_s, c100_s); -- 100 Hz
	Divide_10_10hz : entity work.c10ec PORT MAP(rb_i, clk_12M, c100_s, clr_i, q10_s, c10_s); -- 10 Hz
	Divide_10_1hz : entity work.c10ec PORT MAP(rb_i, clk_12M, c10_s, clr_i, q1_s, c1_s); -- 1 Hz
	
	Divide_2 : entity work.c02ec PORT MAP(rb_i, clk_12M, c1_s, clr_i, q2_s, c2_s); -- 1/2 Hz
	
	Divide_5 : entity work.c05ec PORT MAP(rb_i, clk_12M, c1_s, clr_i, q5_s, c5_s); -- 1/5 Hz
	
	pipeline : PROCESS (clk_12M)
	BEGIN
		IF(rising_edge(clk_12M)) THEN
			clk_1m_o <= c1K_s;
			clk_2s_o <= c2_s;
			clk_5s_o <= c5_s;
		END IF;
	END PROCESS pipeline;
	

END arch;