LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ARCHITECTURE morse_decoder_a OF morse_decoder_e IS

    TYPE state_t IS (idle_st, bit_7_hold_st, temp_bit_7_st, bit_7_dash_hold_st, assign_bit_7_dot_st, assign_bit_7_dash_st,
                    w_bit_6_st, bit_6_hold_st, temp_bit_6_st, bit_6_dash_hold_st, assign_bit_6_dot_st, assign_bit_6_dash_st,
                    w_bit_5_st, bit_5_hold_st, temp_bit_5_st, bit_5_dash_hold_st, assign_bit_5_dot_st, assign_bit_5_dash_st,
                    w_bit_4_st, bit_4_hold_st, temp_bit_4_st, bit_4_dash_hold_st, assign_bit_4_dot_st, assign_bit_4_dash_st,
                    w_bit_3_st, bit_3_hold_st, temp_bit_3_st, bit_3_dash_hold_st, assign_bit_3_dot_st, assign_bit_3_dash_st,
                    w_bit_2_st, bit_2_hold_st, temp_bit_2_st, bit_2_dash_hold_st, assign_bit_2_dot_st, assign_bit_2_dash_st,
                    w_bit_1_st, bit_1_hold_st, temp_bit_1_st, bit_1_dash_hold_st, assign_bit_1_dot_st, assign_bit_1_dash_st,
                    w_bit_0_st, bit_0_hold_st, temp_bit_0_st, bit_0_dash_hold_st, assign_bit_0_dot_st, assign_bit_0_dash_st,
					assign_out_st
    );
    SIGNAL state_s : state_t := idle_st;
    SIGNAL char_ascii_s : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

    StateProcess : PROCESS (clk_i, rst_i)
    BEGIN
        IF(rst_i = '0') THEN
            state_s <= idle_st;
			char_ascii_s <= (OTHERS => '0');
        ELSIF(clk_i = '1' AND clk_i'EVENT AND clk_i'LAST_VALUE = '0') THEN
            CASE state_s IS

                ------------- bit 7----------------------------------------
                WHEN idle_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_7_hold_st; 
                                ELSE 
                                    state_s <= idle_st; 
                                END IF;
								char_ascii_s <= (OTHERS => '0');

                WHEN bit_7_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_7_st; 
                                        ELSE 
                                            state_s <= bit_7_hold_st; 
                                        END IF;
                WHEN temp_bit_7_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_7_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_7_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_7_st; 
                                        END IF;

                WHEN bit_7_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_7_dash_st;
                                            END IF;
                WHEN assign_bit_7_dot_st => state_s <= w_bit_6_st;  char_ascii_s(7) <= '1';
                WHEN assign_bit_7_dash_st => state_s <= w_bit_6_st; char_ascii_s(7) <= '0';

                ------------- bit 6----------------------------------------
                WHEN w_bit_6_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_6_hold_st; 
                                ELSE 
                                    state_s <= w_bit_6_st; 
                                END IF;

                WHEN bit_6_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_6_st; 
                                        ELSE 
                                            state_s <= bit_6_hold_st; 
                                        END IF;
                WHEN temp_bit_6_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_6_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_6_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_6_st; 
                                        END IF;

                WHEN bit_6_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_6_dash_st;
                                            END IF;
                WHEN assign_bit_6_dot_st => state_s <= w_bit_5_st;  char_ascii_s(6) <= '1';
                WHEN assign_bit_6_dash_st => state_s <= w_bit_5_st;  char_ascii_s(6) <= '0';
                ------------- bit 5----------------------------------------
                WHEN w_bit_5_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_5_hold_st; 
                                ELSE 
                                    state_s <= w_bit_5_st; 
                                END IF;

                WHEN bit_5_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_5_st; 
                                        ELSE 
                                            state_s <= bit_5_hold_st; 
                                        END IF;
                WHEN temp_bit_5_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_5_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_5_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_5_st; 
                                        END IF;

                WHEN bit_5_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_5_dash_st;
                                            END IF; 
                WHEN assign_bit_5_dot_st => state_s <= w_bit_4_st;  char_ascii_s(5) <= '1';
                WHEN assign_bit_5_dash_st => state_s <= w_bit_4_st;  char_ascii_s(5) <= '0';

                 ------------- bit 4----------------------------------------
                WHEN w_bit_4_st => IF (mc_i = '1') THEN 
                                        state_s <= bit_4_hold_st; 
                                    ELSE 
                                        state_s <= w_bit_4_st; 
                                    END IF;

                WHEN bit_4_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_4_st; 
                                        ELSE 
                                            state_s <= bit_4_hold_st; 
                                        END IF;
                WHEN temp_bit_4_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_4_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_4_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_4_st; 
                                        END IF;

                WHEN bit_4_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_4_dash_st;
                                            END IF;
                WHEN assign_bit_4_dot_st => state_s <= w_bit_3_st; char_ascii_s(4) <= '1';
                WHEN assign_bit_4_dash_st => state_s <= w_bit_3_st; char_ascii_s(4) <= '0';

                
                ------------- bit 3----------------------------------------
                WHEN w_bit_3_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_3_hold_st; 
                                ELSE 
                                    state_s <= w_bit_3_st; 
                                END IF;

                WHEN bit_3_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_3_st; 
                                        ELSE 
                                            state_s <= bit_3_hold_st; 
                                        END IF;
                WHEN temp_bit_3_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_3_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_3_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_3_st; 
                                        END IF;

                WHEN bit_3_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_3_dash_st;
                                            END IF;
                WHEN assign_bit_3_dot_st => state_s <= w_bit_2_st; char_ascii_s(3) <= '1';
                WHEN assign_bit_3_dash_st => state_s <= w_bit_2_st; char_ascii_s(3) <= '0';

                ------------- bit 2----------------------------------------
                WHEN w_bit_2_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_2_hold_st; 
                                ELSE 
                                    state_s <= w_bit_2_st; 
                                END IF;

                WHEN bit_2_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_2_st; 
                                        ELSE 
                                            state_s <= bit_2_hold_st; 
                                        END IF;
                WHEN temp_bit_2_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_2_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_2_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_2_st; 
                                        END IF;

                WHEN bit_2_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_2_dash_st;
                                            END IF;
                WHEN assign_bit_2_dot_st => state_s <= w_bit_1_st; char_ascii_s(2) <= '1';
                WHEN assign_bit_2_dash_st => state_s <= w_bit_1_st; char_ascii_s(2) <= '0';

                ------------- bit 1----------------------------------------
                WHEN w_bit_1_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_1_hold_st; 
                                ELSE 
                                    state_s <= w_bit_1_st; 
                                END IF;

                WHEN bit_1_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_1_st; 
                                        ELSE 
                                            state_s <= bit_1_hold_st; 
                                        END IF;
                WHEN temp_bit_1_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_1_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_1_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_1_st; 
                                        END IF;

                WHEN bit_1_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_1_dash_st;
                                            END IF;
                WHEN assign_bit_1_dot_st => state_s <= w_bit_0_st; char_ascii_s(1) <= '1';
                WHEN assign_bit_1_dash_st => state_s <= w_bit_0_st; char_ascii_s(1) <= '0';
 
                ------------- bit 0----------------------------------------
                WHEN w_bit_0_st => IF (mc_i = '1') THEN 
                                    state_s <= bit_0_hold_st; 
                                ELSE 
                                    state_s <= w_bit_0_st; 
                                END IF;

                WHEN bit_0_hold_st =>   IF (dot_i = '1') THEN 
                                            state_s <= temp_bit_0_st; 
                                        ELSE 
                                            state_s <= bit_0_hold_st; 
                                        END IF;
                WHEN temp_bit_0_st =>   IF (mc_i = '0') THEN 
                                            state_s <= assign_bit_0_dot_st;     
                                        ELSIF (mc_i = '1') THEN 
                                            state_s <= bit_0_dash_hold_st; 
                                        ELSE 
                                            state_s <= temp_bit_0_st; 
                                        END IF;

                WHEN bit_0_dash_hold_st =>  IF (dash_i = '1' and mc_i = '1') then
                                                state_s <= assign_bit_0_dash_st;
                                            END IF;
                WHEN assign_bit_0_dot_st => state_s <= assign_out_st; char_ascii_s(0) <= '1';
                WHEN assign_bit_0_dash_st => state_s <= assign_out_st; char_ascii_s(0) <= '0';
				
				WHEN assign_out_st => state_s <= idle_st;
                WHEN OTHERS => state_s <= idle_st;
            END CASE;
        END IF;

    END PROCESS StateProcess;

    transition : PROCESS (state_s, char_ascii_s)
    BEGIN
        CASE state_s IS
                    
            ------------ bit 7 ---------------------
            WHEN idle_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN bit_7_hold_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN temp_bit_7_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN bit_7_dash_hold_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_7_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_7_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 6 ---------------------
            WHEN w_bit_6_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_6_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_6_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_6_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_6_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_6_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 5 ---------------------
            WHEN w_bit_5_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_5_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_5_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN bit_5_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_5_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_5_dash_st => char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';

            ------------ bit 4 ---------------------
            WHEN w_bit_4_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_4_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_4_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_4_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_4_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_4_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 3 ---------------------
            WHEN w_bit_3_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_3_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_3_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_3_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_3_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_3_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 2 ---------------------
            WHEN w_bit_2_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_2_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_2_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_2_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_2_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_2_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 1 ---------------------
            WHEN w_bit_1_st =>  char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN bit_1_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_1_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_1_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_1_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_1_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';

            ------------ bit 0 ---------------------
            WHEN w_bit_0_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_0_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN temp_bit_0_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN bit_0_dash_hold_st =>  char_ascii_o <= (OTHERS => '0');char_dv_o <= '0';
            WHEN assign_bit_0_dot_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
            WHEN assign_bit_0_dash_st => char_ascii_o <= (OTHERS => '0'); char_dv_o <= '0';
			
			WHEN assign_out_st => char_ascii_o <= char_ascii_s; char_dv_o <= '1';

        END CASE;
    END PROCESS transition;

END morse_decoder_a;