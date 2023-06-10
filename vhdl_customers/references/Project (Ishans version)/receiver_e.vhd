LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;


ENTITY receiver_e IS  
	
	PORT(
		clk_i           :IN  STD_LOGIC;         
        rst_n_i           :IN  STD_LOGIC;         
        rx_i          :IN  STD_LOGIC;  
		bd_gen_i          :IN  STD_LOGIC;  
		en_bg_i              :IN  STD_LOGIC; 
		even_i              :IN  STD_LOGIC;  --parity generated
        rx_en_o          :OUT STD_LOGIC;         --enable Baud Rate Generator
		rx_dat_o          :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)        --signal output
		rx_par_o          :OUT STD_LOGIC_VECTOR(7 DOWNTO 0)        --signal output to parity generator
		
	);
	END receiver_e ;		