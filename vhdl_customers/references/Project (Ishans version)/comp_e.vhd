LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY comp_e IS 
	PORT( 
		clk_i : IN STD_LOGIC;
		rst_n_i : IN STD_LOGIC;
		comp_i	     :IN  STD_LOGIC_VECTOR(7 downto 0); 
		data_mux_i :   IN  STD_LOGIC_VECTOR(7 downto 0);
		led1_o         :OUT STD_LOGIC
	);
	END comp_e ;	
