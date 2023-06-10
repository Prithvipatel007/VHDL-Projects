LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------
ENTITY reset_generator IS
	PORT(
		clk_12M : IN STD_LOGIC;
		clk_5s_i : IN STD_LOGIC;
		rb_o	:	OUT STD_LOGIC
	);
END reset_generator;

ARCHITECTURE arch OF reset_generator IS
	
BEGIN
	clocked : PROCESS (clk_12M)
	BEGIN
		IF(rising_edge(clk_12M)) THEN
			IF (clk_5s_i = '1') THEN
				rb_o <= '0';
			ELSE
				rb_o <= '1' ;
			END IF;
		END IF;
	END PROCESS clocked;
END arch;
