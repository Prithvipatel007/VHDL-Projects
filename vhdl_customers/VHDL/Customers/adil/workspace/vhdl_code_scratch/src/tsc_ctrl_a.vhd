ARCHITECTURE tsc_ctrl_a OF tsc_ctrl_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (idle_st, temp_st, process1_st, process2_st);
    SIGNAL cstate_s : state_name := idle_st;
    SIGNAL h_0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL h_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL m_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL m_0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL s_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL s_0_s : STD_LOGIC_VECTOR(3 downto 0);
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i,rb_i,sx_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= idle_st;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN idle_st    => IF(sx_i = '1') THEN cstate_s <= temp_st; ELSE cstate_s <= idle_st; END IF;
                WHEN temp_st    => cstate_s <= process1_st;
                WHEN process1_st => IF(dr_i = '1') THEN cstate_s <= process2_st; ELSE cstate_s <= process1_st; END IF;
                WHEN process2_st => IF(sx_i = '0') THEN cstate_s <= idle_st; ELSE cstate_s <= process2_st; END IF;
            END CASE;	  
        END IF;
    END PROCESS clocked;
----------------------------------------------------------------------------------------------------------------------------------------------

    task : PROCESS(cstate_s, dr_i)
    BEGIN 
        CASE cstate_s IS

            WHEN idle_st     =>  h_0_o <= (OTHERS => '0'); 
                                 h_1_o <= (OTHERS => '0');
                                 m_1_o <= (OTHERS => '0');
                                 m_0_o <= (OTHERS => '0');
                                 s_1_o <= (OTHERS => '0');
                                 s_0_o <= (OTHERS => '0');
                                 h_0_s <= (OTHERS => '0'); 
                                 h_1_s <= (OTHERS => '0');
                                 m_1_s <= (OTHERS => '0');
                                 m_0_s <= (OTHERS => '0');
                                 s_1_s <= (OTHERS => '0');
                                 s_0_s <= (OTHERS => '0');
                                 dv_o <= '0';
                                 m0_state_o <= '0';
                                 m1_state_o <= '0';
                                 t0_state_o <= '0';
                                 t1_state_o <= '0';

            WHEN temp_st     =>  h_0_o <= (OTHERS => '0'); 
                                h_1_o <= (OTHERS => '0');
                                m_1_o <= (OTHERS => '0');
                                m_0_o <= (OTHERS => '0');
                                s_1_o <= (OTHERS => '0');
                                s_0_o <= (OTHERS => '0');
                                h_0_s <= h_0_i; 
                                h_1_s <= h_1_i;
                                m_1_s <= m_1_i;
                                m_0_s <= m_0_i;
                                s_1_s <= s_1_i;
                                s_0_s <= s_0_i;
                                dv_o <= '0';
                                m0_state_o <= '0';
                                m1_state_o <= '0';
                                t0_state_o <= '0';
                                t1_state_o <= '0';
            
            WHEN process1_st  => h_0_o <= h_0_s; 
                                h_1_o <= h_1_s;
                                m_1_o <= m_1_s;
                                m_0_o <= m_0_s;
                                s_1_o <= s_1_s;
                                s_0_o <= s_0_s;
                                h_0_s <= h_0_s; 
                                h_1_s <= h_1_s;
                                m_1_s <= m_1_s;
                                m_0_s <= m_0_s;
                                s_1_s <= s_1_s;
                                s_0_s <= s_0_s;
                                dv_o <= '1';
                                m0_state_o <= '0';
                                m1_state_o <= '0';
                                t0_state_o <= '0';
                                t1_state_o <= '0';

            WHEN process2_st  => h_0_o <= h_0_s; 
                                h_1_o <= h_1_s;
                                m_1_o <= m_1_s;
                                m_0_o <= m_0_s;
                                s_1_o <= s_1_s;
                                s_0_o <= s_0_s;
                                h_0_s <= h_0_s; 
                                h_1_s <= h_1_s;
                                m_1_s <= m_1_s;
                                m_0_s <= m_0_s;
                                s_1_s <= s_1_s;
                                s_0_s <= s_0_s;
                                dv_o <= '1';
                                m0_state_o <= m0_i;
                                m1_state_o <= m1_i;
                                t0_state_o <= t0_i;
                                t1_state_o <= t1_i;
        END CASE;
    END PROCESS task;
END tsc_ctrl_a;
