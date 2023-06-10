LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ARCHITECTURE paritygen_a OF paritygen_e  IS
SIGNAL i:STD_LOGIC;
BEGIN
	PROCESS(rst_n_i,clk_i)
		BEGIN 
		IF (rst_n_i = '0') THEN
			even_o  <= '0';
		ELSIF(clk_i'EVENT AND clk_i = '1')
		i<= (inp_i(0) xor inp_i(1)) xor (inp_i(2) xor inp_i(3)) xor (inp_i(4) xor inp_i(5)) xor (inp_i(6) xor inp_i(7));
		even_o<= i;
	END if;
	
END PROCESS;



END paritygen_a;	