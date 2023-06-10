LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY mem_e IS 
	PORT( 
		clk_i : IN STD_LOGIC;
		rst_n_i : IN STD_LOGIC; 
		reg1_i, reg2_i, reg3_i, reg4_i :   IN  STD_LOGIC_VECTOR(7 downto 0);
		reg1_o, reg2_o, reg3_o, reg4_o         :OUT STD_LOGIC_VECTOR(7 downto 0)
	);
	END mem_e ;			