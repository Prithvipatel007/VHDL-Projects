ARCHITECTURE uart_tx_a OF uart_tx_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (idle_st,start_st, data_st, stop_1_st, stop_2_st);
    SIGNAL state_s : state_name := idle_st;
    SIGNAL acc_s : STD_LOGIC_VECTOR (7 DOWNTO 0);
	SIGNAL acc_count_s : INTEGER;
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (clk_i,rst_i, acc_s)
    BEGIN
        IF (rst_i= '0') THEN 
			state_s <= idle_st; 
			acc_s <=  (OTHERS => '0');
			acc_count_s <= 8;
			
        ELSIF (rising_edge(clk_i)) THEN
            CASE state_s IS
                WHEN idle_st    => IF(dv_i = '1') THEN 
										state_s <= start_st; 
										acc_s <= char_ascii_i; 
										acc_count_s <= 8;
									END IF; 
									
                WHEN start_st	=> IF(brd_i = '1') THEN 
										state_s <= data_st;
									END IF;
				
				WHEN data_st => IF (acc_count_s = 0) then
									state_s <= stop_1_st;
								ELSIF (brd_i = '1') THEN
									state_s <= data_st;
									acc_count_s <= acc_count_s-1;
								END IF;
				
				WHEN stop_1_st => 	IF(brd_i = '1') THEN 
										state_s <= stop_2_st;
									END IF;
				
				WHEN stop_2_st => 	IF(brd_i = '1') THEN 
										state_s <= idle_st;
									END IF;
				
				WHEN OTHERS => state_s <= idle_st;
            END CASE;	  
        END IF;
    END PROCESS clocked;
	
	task : PROCESS(state_s, acc_s, acc_count_s)
    BEGIN 
        CASE state_s IS
            WHEN idle_st    =>  txd_o <= '1';
            WHEN start_st   =>  txd_o <= '0';
			WHEN data_st 	=> 	IF (acc_count_s = 0) THEN txd_o <= acc_s(acc_count_s); ELSE txd_o <= acc_s(acc_count_s-1); END IF;	
            WHEN stop_1_st	    =>  txd_o <= '1';
            WHEN stop_2_st	    =>  txd_o <= '1';
            WHEN OTHERS	    =>  txd_o <= '1';
        END CASE;
    END PROCESS task;
END uart_tx_a;
