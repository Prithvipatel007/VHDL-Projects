LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------------------------------------------------------

ENTITY debouncer IS
	PORT(
		cp_i 		: 	IN STD_LOGIC;
		rb_i 		: 	IN STD_LOGIC;
		clk_1m_i 	: 	IN STD_LOGIC;
		clk_2s_i 	: 	IN STD_LOGIC;
		clk_5s_i 	: 	IN STD_LOGIC;
		rp_i 		: 	IN STD_LOGIC;
		sp_o		:	OUT STD_LOGIC;
		lp_o		:	OUT STD_LOGIC;
		dv_o		:	OUT STD_LOGIC;
		en_o 		: 	OUT STD_LOGIC;
		clr_o 		:	OUT STD_LOGIC
	);
END debouncer;

ARCHITECTURE arch OF debouncer IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18, s19);
    SIGNAL state_s : state_name := s0;
	SIGNAL en_s, clr_s : STD_LOGIC;
	
	
	TYPE state2_name IS (s0, s1, s2, s3);
	SIGNAL state2_s : state2_name := s0;
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i, clk_1m_i, clk_2s_i, rp_i)
    BEGIN
        IF (rb_i= '0') THEN state_s <= s0;
        ELSIF (rising_edge(cp_i)) THEN
            CASE state_s IS
                WHEN s0 => IF(clk_1m_i='1' AND rp_i = '0') THEN state_s <= s1; ELSE state_s <= s0; END IF;
                WHEN s1 => IF(clk_1m_i='1') THEN state_s <= s2; ELSE state_s <= s1; END IF;
                WHEN s2 => IF(clk_1m_i='1') THEN state_s <= s3; ELSE state_s <= s2; END IF;
                WHEN s3 => IF(clk_1m_i='1') THEN state_s <= s4; ELSE state_s <= s3; END IF;
                WHEN s4 => IF(clk_1m_i='1') THEN state_s <= s5; ELSE state_s <= s4; END IF;
				WHEN s5 => IF(clk_1m_i='1') THEN state_s <= s6; ELSE state_s <= s5; END IF;
                WHEN s6 => IF(clk_1m_i='1') THEN state_s <= s7; ELSE state_s <= s6; END IF;
                WHEN s7 => IF(clk_1m_i='1') THEN state_s <= s8; ELSE state_s <= s7; END IF;
                WHEN s8 => IF(clk_1m_i='1') THEN state_s <= s9; ELSE state_s <= s8; END IF;
                WHEN s9 => IF(clk_1m_i='1') THEN state_s <= s10; ELSE state_s <= s9; END IF;
				WHEN s10 => IF(clk_1m_i='1') THEN state_s <= s11; ELSE state_s <= s10; END IF;
                WHEN s11 => IF(clk_1m_i='1') THEN state_s <= s12; ELSE state_s <= s11; END IF;
                WHEN s12 => IF(clk_1m_i='1') THEN state_s <= s13; ELSE state_s <= s12; END IF;
                WHEN s13 => IF(clk_1m_i='1') THEN state_s <= s14; ELSE state_s <= s13; END IF;
                WHEN s14 => IF(clk_1m_i='1') THEN state_s <= s15; ELSE state_s <= s14; END IF;
                WHEN s15 => IF(clk_2s_i='1') THEN state_s <= s16; ELSE state_s <= s15; END IF;
				WHEN s16 => IF(rp_i = '1') THEN state_s <= s17; ELSIF(rp_i = '0') THEN state_s <= s18; ELSE state_s <= s16; END IF;
				WHEN s17 => state_s <= s19;
				WHEN s18 => state_s <= s19;
				WHEN s19 => IF(rp_i = '1') THEN
								state_s <= s0;
							ELSE 
								state_s <= s19;
							END IF;
				WHEN OTHERS => state_s <= s0;
            END CASE;	  
        END IF;
    END PROCESS clocked;
	
	results : PROCESS(state_s)
	BEGIN
		
		CASE state_s IS 
		
			WHEN s0 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s1 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s2 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s3 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
			WHEN s4 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s5 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s6 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s7 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s8 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s9 => 	sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s10 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s11 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s12 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s13 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s14 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s15 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s16 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
						
			WHEN s17 => sp_o <= '1'; 
						lp_o <= '0'; 
						dv_o <= '1';
						
			WHEN s18 => sp_o <= '0'; 
						lp_o <= '1'; 
						dv_o <= '1';
						
			WHEN s19 => sp_o <= '0'; 
						lp_o <= '0'; 
						dv_o <= '0';
		END CASE;
	
	END PROCESS results;
	
	reset_func : PROCESS (cp_i, rp_i)
	BEGIN
		IF (rb_i= '0') THEN state2_s <= s0;
        ELSIF (rising_edge(cp_i)) THEN
            CASE state2_s IS
                WHEN s0 => IF(rp_i = '0') THEN state2_s <= s1; ELSE state2_s <= s0; END IF;
                WHEN s1 => 	IF(clk_2s_i = '1' and rp_i = '0') THEN
								state2_s <= s3;
							ELSIF(clk_2s_i = '1' and rp_i = '1') THEN 
								state2_s <= s2; 
							ELSE 
								state2_s <= s1; 
							END IF;
				WHEN s2 => if(rp_i = '1') THEN 
								state2_s <= s0; 
							ELSE 
								state2_s <= s2;	
							END IF;	-- for delay - same as s0 state
				WHEN s3 => 	IF(clk_5s_i = '0' and rp_i = '1') THEN
								state2_s <= s0;
							ELSIF((clk_5s_i = '1' and rp_i = '0') OR (clk_5s_i = '1' and rp_i = '1')) THEN
								state2_s <= s0;
							ELSE
								state2_s <= s3;
							END IF;
				WHEN OTHERS => state2_s <= s0;
            END CASE;
		END IF;
	END PROCESS reset_func;
	
	reset_res : PROCESS (state2_s)
	BEGIN
		CASE state2_s IS 
		
			WHEN s0 => 	en_s <= '0'; 
						clr_s <= '1';
						
			WHEN s1 => 	en_s <= '1'; 
						clr_s <= '0';
						
			WHEN s2 => 	en_s <= '1'; 
						clr_s <= '0';
			
			WHEN s3 => 	en_s <= '1'; 
						clr_s <= '0';
		END CASE;
	END PROCESS reset_res;
	
	clr_o <= clr_s;
	en_o <= en_s;
	
END arch;