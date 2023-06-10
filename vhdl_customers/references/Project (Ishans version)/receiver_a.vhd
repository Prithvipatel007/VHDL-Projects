LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;


ARCHITECTURE receiver_a OF receiver_e IS
	
	TYPE rx_sm_main_t IS (rx_idle_st, rx_start_bit_st, rx_data_bit_st,rx_parity_bit_st,rx_stop_bit_st);
	SIGNAL rx_sm_main_s 	   : rx_sm_main_t;  -- SIGNAL for our enumeration TYPE. At first at idle state
	SIGNAL rx_bit_index_s : INTEGER RANGE 0 TO 7+1;  	-- 8 Bits TOtal +1 for counter
	SIGNAL rx_bit_s   	: STD_LOGIC_VECTOR( 0 TO 7); 	-- adds data IN byte order/ should be (OTHERS => '0')	
	

BEGIN 
	
	uart_rx_p : PROCESS (clk_i,rst_n_i)
		BEGIN
		
		IF (rst_n_i = '0') THEN
			rx_en_o <= '0';
			rx_dat_o <= (OTHERS=>'0');
			rx_bit_s		<= (OTHERS => '0');
			rx_bit_index_s	<= 0;
		rx_sm_main_s	<= rx_idle_st;	
		ELSIF (clk_i'EVENT AND clk_i = '1') THEN
			
			CASE rx_sm_main_s IS
				--						 IDLE STATE
				WHEN rx_idle_st =>
				rx_bit_index_s	<= 0;
				IF rx_i  = '0' THEN          			--start bit detection
					rx_sm_main_s	<= rx_start_bit_st;
				rx_en_o <= '1';
				ELSE
					rx_en_o		<= '0';
					rx_sm_main_s	<= rx_idle_st;
				END IF;	
				
				WHEN rx_start_bit_st =>							-- Checking middle of the start bit to make sure that it's still low
				rx_en_o	<= '0';
				IF (en_bg_i  = '1') THEN 
					IF rx_i  = '0' THEN
					rx_sm_main_s	<= rx_data_bit_st;
					ELSE
						rx_sm_main_s	<= rx_idle_st;
					END IF;
					ELSE
						rx_sm_main_s	<= rx_start_bit_st;
					END IF;	
					
					
					
					WHEN rx_data_bit_st =>                        -- Data Bit State
					
					IF (bd_gen_i = '1') THEN
						
						IF (rx_bit_index_s < 8) THEN			-- Checking if all bits are sent
							rx_bit_s(rx_bit_index_s) <= rx_i;  		-- rx_bit_s contains the parallel received data IN byte format
							rx_bit_index_s <= rx_bit_index_s + 1; -- counts up to max 8 to cancel the if 'rx_bit_index_s < 9' condition 					
						rx_sm_main_s   <= rx_data_bit_st; 
						ELSE
							rx_sm_main_s   <= rx_parity_bit_st;
							rx_bit_index_s <= 0;
						END IF;
					END IF;
					
					
					WHEN rx_parity_bit_st =>		  -- parity Bit State
					
					IF (bd_gen_i = '1') THEN	
					    IF(rx_i = even_i) THEN
						rx_sm_main_s <= rx_stop_bit_st;
						ELSE
						    rx_dat_o <= "00000000";
							rx_sm_main_s <= rx_parity_bit_st;
						END IF;
					END IF;
					
					
					
					WHEN rx_stop_bit_st =>	
					
					IF (bd_gen_i = '1') THEN			
					rx_sm_main_s    <= rx_idle_st;
					ELSE
						
						rx_sm_main_s <= rx_stop_bit_st;
					END IF;
					
					WHEN OTHERS => rx_sm_main_s <= rx_idle_st;
					
					
					
			END CASE;
		END IF;
	END PROCESS uart_rx_p;
	rx_dat_o <= rx_bit_s;
	rx_par_o <= rx_bit_s; 
	
END receiver_a;
