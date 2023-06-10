----------------------------------------------------------------
-- Receiver Architecture
----------------------------------------------------------------
ARCHITECTURE receiver_a OF receiver_e is

TYPE rxd_t IS (idle_st, start_st, start_m_st, data_st,prt_st, stop_st);

SIGNAL rxd_t_s : rxd_t;
SIGNAL bit_cnt_s : INTEGER RANGE 0 TO 7+1;

BEGIN
  uart_rxd : PROCESS (clk_i,rst_i)
  BEGIN
---------------------------------------------------------------- Resest
    IF (rst_i = '0') THEN
			   bd_ena_o <= '0';
			   bit_ena_o <= '0';
			   prt_ena_o <= '0';
			   prt_o <= '0';
			   bit_o <= '0';
			   rxd_t_s <= idle_st;
---------------------------------------------------------------- Clock
    ELSIF (clk_i'EVENT AND clk_i = '1') THEN
      CASE rxd_t_s IS
---------------------------------------------------------------- Idle Bit
        WHEN idle_st =>
          IF (rxd_i = '1') THEN
            rxd_t_s <= start_st;
            bd_ena_o <= '1';
          ELSE
            rxd_t_s <= idle_st;
            bd_ena_o <= '0';
          END IF;
---------------------------------------------------------------- Start Bit
        WHEN start_st =>
          IF (bd9k6_i ='1') THEN
            IF (rxd_i = '0') THEN
              rxd_t_s <= start_m_st;
            ELSE
              rxd_t_s <= idle_st;
            END IF;
          ELSE
            rxd_t_s <= start_st;
          END IF;
---------------------------------------------------------------- Start Bit Middle
		WHEN start_m_st =>
          IF (bd9k6_i = '0') THEN
            IF (rxd_i = '0') THEN
              rxd_t_s <= data_st;
            ELSE
              rxd_t_s <= idle_st;
            END IF;
          ELSE
            rxd_t_s <= start_m_st;
          END IF;
---------------------------------------------------------------- Data Bits  
        WHEN data_st =>
          IF (bit_cnt_s < 8) THEN
            IF (bd9k6_i ='1') THEN
              bit_o <= rxd_i;
			  bit_ena_o <= '1';
              bit_cnt_s <= bit_cnt_s + 1;
            ELSE
              rxd_t_s <= data_st;
			  bit_ena_o <= '0';
            END IF;
          ELSE
            rxd_t_s <= prt_st;
			bit_ena_o <= '0';
            bit_cnt_s <= 0;
          END IF;
---------------------------------------------------------------- Parity Bit
        WHEN prt_st =>
		  IF (bd9k6_i = '1') THEN
            prt_o <= rxd_i;
		    prt_ena_o <= '1';
            rxd_t_s <= stop_st;
		  ELSE
		    rxd_t_s <= prt_st;
			prt_ena_o <= '0';
		  END IF;
----------------------------------------------------------------Stop Bit
        WHEN stop_st =>
		  prt_ena_o <= '0';
          IF (bd9k6_i = '1') THEN
            IF (rxd_i = '1') THEN
              rxd_t_s <= idle_st;
            ELSE
              rxd_t_s <= stop_st;
            END IF;
          ELSE
            rxd_t_s <= stop_st;
          END IF;
        WHEN OTHERS => rxd_t_s <= idle_st;
      END CASE;
    END IF;
  END PROCESS;
END receiver_a;
-----------------------------------