-----------------------------------------------------
--Shift Register Entity
-----------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY sft_reg_e IS
	PORT (rst_i : IN std_logic;
		  clk_i : IN std_logic;
		  bit_ena_i : IN std_logic;
		  bit_i	: IN std_logic;
		  pass_o: OUT std_logic_vector(7 DOWNTO 0);
		  dv_o : OUT std_logic);
END sft_reg_e;
-----------------------------------------------------