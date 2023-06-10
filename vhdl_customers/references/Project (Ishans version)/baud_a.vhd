LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;


ARCHITECTURE baud_a OF baud_e IS
	
	SIGNAL counter1 : INTEGER;
	SIGNAL counter2 : INTEGER;
	CONSTANT led_max : NATURAL := 49_999_999;
	SIGNAL led_s : INTEGER RANGE 0 TO led_max;

BEGIN
	PROCESS(rst_n_i,clk_i,bd_en_i)
		BEGIN 
		IF (rst_n_i = '0') THEN
			baud1_o<= '0';
			baud2_o<= '0';
			led_o <= '0';
			counter1<= 0;
			counter2<= 0;
			--led_s<= 0;
			
		
		ELSIF(clk_i'EVENT AND clk_i = '1') THEN
			led_s <= led_s + 1;
			
			IF (led_s =(led_max/2)) THEN led_o <= '1';
			ELSIF (led_s >= led_max) THEN led_o <= '0'; led_s<=0;
			END IF;
			
			
			
			
			IF(bd_en_i='1') THEN
				counter1<=counter1+1;
				counter2<=counter2+1;
				
				
				IF(counter1 >= 5200) THEN
					baud1_o <= '1';
				counter1<= 0;
				ELSE
					baud1_o<= '0';
				END IF;
				
				IF(counter2 >= 2600) THEN
					baud2_o<= '1';
				counter2<= 0;
				ELSE
					baud2_o<= '0';
				END IF;
			
			ELSE
				baud1_o<= '0';
				baud2_o<= '0';
			END IF;
		END IF;
	END PROCESS;
END baud_a;



