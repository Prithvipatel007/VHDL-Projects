ARCHITECTURE arch OF tsc_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (idle_st, temp_st, process1_st, process2_st);
    SIGNAL cstate_s : state_name := idle_st;
    SIGNAL hour_0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL hour_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL minutes_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL minutes_0_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL seconds_1_s : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL seconds_0_s : STD_LOGIC_VECTOR(3 downto 0);
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

            WHEN idle_st     =>  hour_0_o <= (OTHERS => '0'); 
                                 hour_1_o <= (OTHERS => '0');
                                 minutes_1_o <= (OTHERS => '0');
                                 minutes_0_o <= (OTHERS => '0');
                                 seconds_1_o <= (OTHERS => '0');
                                 seconds_0_o <= (OTHERS => '0');
                                 hour_0_s <= (OTHERS => '0'); 
                                 hour_1_s <= (OTHERS => '0');
                                 minutes_1_s <= (OTHERS => '0');
                                 minutes_0_s <= (OTHERS => '0');
                                 seconds_1_s <= (OTHERS => '0');
                                 seconds_0_s <= (OTHERS => '0');
                                 dv_o <= '0';
                                 m0_state_o <= '0';
                                 m1_state_o <= '0';
                                 m2_state_o <= '0';
                                 m3_state_o <= '0';

            WHEN temp_st     =>  hour_0_o <= (OTHERS => '0'); 
                                hour_1_o <= (OTHERS => '0');
                                minutes_1_o <= (OTHERS => '0');
                                minutes_0_o <= (OTHERS => '0');
                                seconds_1_o <= (OTHERS => '0');
                                seconds_0_o <= (OTHERS => '0');
                                hour_0_s <= hour_0_i; 
                                hour_1_s <= hour_1_i;
                                minutes_1_s <= minutes_1_i;
                                minutes_0_s <= minutes_0_i;
                                seconds_1_s <= seconds_1_i;
                                seconds_0_s <= seconds_0_i;
                                dv_o <= '0';
                                m0_state_o <= '0';
                                m1_state_o <= '0';
                                m2_state_o <= '0';
                                m3_state_o <= '0';
            
            WHEN process1_st  => hour_0_o <= hour_0_s; 
                                hour_1_o <= hour_1_s;
                                minutes_1_o <= minutes_1_s;
                                minutes_0_o <= minutes_0_s;
                                seconds_1_o <= seconds_1_s;
                                seconds_0_o <= seconds_0_s;
                                hour_0_s <= hour_0_s; 
                                hour_1_s <= hour_1_s;
                                minutes_1_s <= minutes_1_s;
                                minutes_0_s <= minutes_0_s;
                                seconds_1_s <= seconds_1_s;
                                seconds_0_s <= seconds_0_s;
                                dv_o <= '1';
                                m0_state_o <= m0_i;
                                m1_state_o <= m1_i;
                                m2_state_o <= m2_i;
                                m3_state_o <= m3_i;

            WHEN process2_st  => hour_0_o <= hour_0_s; 
                                hour_1_o <= hour_1_s;
                                minutes_1_o <= minutes_1_s;
                                minutes_0_o <= minutes_0_s;
                                seconds_1_o <= seconds_1_s;
                                seconds_0_o <= seconds_0_s;
                                hour_0_s <= hour_0_s; 
                                hour_1_s <= hour_1_s;
                                minutes_1_s <= minutes_1_s;
                                minutes_0_s <= minutes_0_s;
                                seconds_1_s <= seconds_1_s;
                                seconds_0_s <= seconds_0_s;
                                dv_o <= '1';
                                m0_state_o <= m0_i;
                                m1_state_o <= m1_i;
                                m2_state_o <= m2_i;
                                m3_state_o <= m3_i;
        END CASE;
    END PROCESS task;
END arch;
