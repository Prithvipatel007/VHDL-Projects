LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

ARCHITECTURE ata_ctrl_a OF ata_ctrl_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (idle_st, data_valid_st, comb_m_00_st, comb_m_01_st, comb_m_10_st, comb_m_11_st, r_comp_m_st, result_st);
    SIGNAL cstate_s : state_name := idle_st;
    SIGNAL et_h0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL et_h1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL et_m1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL et_m0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL et_s1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL et_s0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL min_1_s : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    SIGNAL min_2_s : STD_LOGIC_VECTOR(3 downto 0) := "0010";
    SIGNAL min_3_s : STD_LOGIC_VECTOR(3 downto 0) := "0011";
    SIGNAL min_4_s : STD_LOGIC_VECTOR(3 downto 0) := "0100";
    SIGNAL min_5_s : STD_LOGIC_VECTOR(3 downto 0) := "0101";
    SIGNAL min_9_s : STD_LOGIC_VECTOR(3 downto 0) := "1001";
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i,rb_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= idle_st;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN idle_st => IF(dv_i = '1') THEN 
                                    cstate_s <= data_valid_st;
                                END IF;  -- check if the data is valid and add time depending on the mode state
                WHEN data_valid_st	=>  IF(m0_state_i = '0' AND m1_state_i = '0') THEN 
                                            cstate_s <= comb_m_00_st;
                                        ELSIF(m0_state_i = '0' AND m1_state_i = '1') THEN 
                                            cstate_s <= comb_m_01_st;
                                        ELSIF(m0_state_i = '1' AND m1_state_i = '0') THEN 
                                            cstate_s <= comb_m_10_st;
                                        ELSIF(m0_state_i = '1' AND m1_state_i = '1') THEN 
                                            cstate_s <= comb_m_11_st;
                                        ELSE 
                                            cstate_s <= data_valid_st; 
                                        END IF;
                
                WHEN comb_m_00_st   =>  IF(unsigned(et_m1_s) > unsigned(min_9_s)) THEN 
                                            cstate_s <= r_comp_m_st; 
                                        ELSIF(et_h0_s = c_h_0_i AND et_h1_s = c_h_1_i AND et_m1_s = c_m_1_i AND 
                                                et_m0_s = c_m_0_i AND et_s1_s = c_s_1_i AND et_s0_s = c_s_0_i) THEN
                                            cstate_s <= result_st;
                                        ELSE 
                                            cstate_s <= comb_m_00_st; 
                                        END IF;

                WHEN comb_m_01_st   =>  IF(unsigned(et_m1_s) > unsigned(min_9_s)) THEN 
                                            cstate_s <= r_comp_m_st; 
                                            ELSIF(et_h0_s = c_h_0_i AND et_h1_s = c_h_1_i AND et_m1_s = c_m_1_i AND 
                                                et_m0_s = c_m_0_i AND et_s1_s = c_s_1_i AND et_s0_s = c_s_0_i) THEN
                                            cstate_s <= result_st;
                                        ELSE 
                                            cstate_s <= comb_m_01_st; 
                                        END IF;

                WHEN comb_m_10_st   =>  IF(unsigned(et_m1_s) > unsigned(min_9_s)) THEN 
                                            cstate_s <= r_comp_m_st; 
                                            ELSIF(et_h0_s = c_h_0_i AND et_h1_s = c_h_1_i AND et_m1_s = c_m_1_i AND 
                                                et_m0_s = c_m_0_i AND et_s1_s = c_s_1_i AND et_s0_s = c_s_0_i) THEN
                                            cstate_s <= result_st;
                                        ELSE 
                                            cstate_s <= comb_m_10_st; 
                                        END IF;

                WHEN comb_m_11_st   =>  IF(unsigned(et_m1_s) > unsigned(min_9_s)) THEN 
                                            cstate_s <= r_comp_m_st; 
                                            ELSIF(et_h0_s = c_h_0_i AND et_h1_s = c_h_1_i AND et_m1_s = c_m_1_i AND 
                                                et_m0_s = c_m_0_i AND et_s1_s = c_s_1_i AND et_s0_s = c_s_0_i) THEN
                                            cstate_s <= result_st;
                                        ELSE 
                                            cstate_s <= comb_m_11_st; 
                                        END IF;
                WHEN r_comp_m_st      =>  IF(et_h0_s = c_h_0_i AND et_h1_s = c_h_1_i AND et_m1_s = c_m_1_i AND et_m0_s = c_m_0_i AND et_s1_s = c_s_1_i AND et_s0_s = c_s_0_i) THEN cstate_s <= result_st; ELSE cstate_s <= r_comp_m_st; END IF;
                WHEN result_st      =>  IF(off_btn_i = '1') THEN cstate_s <= idle_st; ELSE cstate_s <= result_st; END IF;
                WHEN OTHERS         =>  cstate_s <= idle_st;
            END CASE;
        END IF;
    END PROCESS clocked;
----------------------------------------------------------------------------------------------------------------------------------------------

    task : PROCESS(cstate_s)
    BEGIN 
        CASE cstate_s IS

            WHEN idle_st        =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= (OTHERS => '0');
                                    et_h1_s <= (OTHERS => '0');
                                    et_m0_s <= (OTHERS => '0');
                                    et_m1_s <= (OTHERS => '0');
                                    et_s0_s <= (OTHERS => '0');
                                    et_s1_s <= (OTHERS => '0');
                                    toa_valid_o <= '0';
                                    dr_o <= '1';
                                    snd_o <= '0';
                                    snd_led_o <= '0';
            
            WHEN data_valid_st  =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= m_1_i;
                                    et_m0_s <= m_0_i;
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';

            WHEN comb_m_00_st      =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= std_logic_vector(unsigned(m_1_i) + unsigned(min_2_s));
                                    et_m0_s <= m_0_i;
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';
            
            WHEN comb_m_01_st      =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= std_logic_vector(unsigned(m_1_i) + unsigned(min_3_s));
                                    et_m0_s <= m_0_i;
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';

            WHEN comb_m_10_st      =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= std_logic_vector(unsigned(m_1_i) + unsigned(min_4_s));
                                    et_m0_s <= m_0_i;
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';

            WHEN comb_m_11_st      =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= std_logic_vector(unsigned(m_1_i) + unsigned(min_5_s));
                                    et_m0_s <= m_0_i;
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';
                                
            WHEN r_comp_m_st      =>  toc_h_0_o <= (OTHERS => '0');
                                    toc_h_1_o <= (OTHERS => '0');
                                    toc_m_1_o <= (OTHERS => '0');
                                    toc_m_0_o <= (OTHERS => '0');
                                    toc_s_1_o <= (OTHERS => '0');
                                    toc_s_0_o <= (OTHERS => '0');
                                    et_h0_s <= h_0_i;
                                    et_h1_s <= h_1_i;
                                    et_m1_s <= std_logic_vector(unsigned(et_m1_s) - unsigned(min_9_s) - unsigned(min_1_s));
                                    et_m0_s <= std_logic_vector(unsigned(et_m0_s) + unsigned(min_1_s));
                                    et_s1_s <= s_1_i;
                                    et_s0_s <= s_0_i;
                                    toa_valid_o <= '0';
                                    dr_o <= '0';
                                    snd_o <= '0';
                                    snd_led_o <= '0';

            WHEN result_st     =>   toc_h_0_o <= et_h0_s;
                                    toc_h_1_o <= et_h1_s;
                                    toc_m_1_o <= et_m1_s;
                                    toc_m_0_o <= et_m0_s;
                                    toc_s_1_o <= et_s1_s;
                                    toc_s_0_o <= et_s0_s;
                                    et_h0_s <= et_h0_s;
                                    et_h1_s <= et_h1_s;
                                    et_m1_s <= et_m1_s;
                                    et_m0_s <= et_m0_s;
                                    et_s1_s <= et_s1_s;
                                    et_s0_s <= et_s0_s;
                                    toa_valid_o <= '1';
                                    dr_o <= '0';
                                    snd_o <= clk_1k_i;
                                    snd_led_o <= sec_q_i;

        END CASE;
    END PROCESS task;
END ata_ctrl_a;

