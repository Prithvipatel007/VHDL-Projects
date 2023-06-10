LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY baud_e IS
	
	PORT(clk_i : IN STD_LOGIC;
		rst_n_i : IN STD_LOGIC;
		bd_en_i  : IN STD_LOGIC;
        baud1_o: OUT STD_LOGIC;
		baud2_o : OUT STD_LOGIC;
	led_o : OUT STD_LOGIC);
END baud_e;

