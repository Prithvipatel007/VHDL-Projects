LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY paritygen_e IS 
	PORT( 
		clk_i : IN STD_LOGIC;
		rst_n_i : IN STD_LOGIC; 
		inp_i :   IN  STD_LOGIC_VECTOR(7 downto 0);
		even_o       :OUT STD_LOGIC
	);
	END paritygen_e ;	