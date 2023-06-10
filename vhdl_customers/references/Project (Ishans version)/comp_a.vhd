LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ARCHITECTURE comp_a OF comp_e  IS
	BEGIN
		PROCESS(clk_i,rst_n_i)
			BEGIN
			IF(rst_n_i = '0') THEN
			led1_o <= '0';
			ELSIF(clk_i'event AND clk_i = '1') THEN
				led1_o  <= '1' WHEN (comp_i = data_mux_i) ELSE '0';
					
					
				END if;
				
			END if;
			
		END PROCESS;
		
	
	END comp_a;
