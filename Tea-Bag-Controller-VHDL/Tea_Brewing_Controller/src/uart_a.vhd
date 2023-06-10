ARCHITECTURE arch OF uart_ctrl_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (wait_s,idle_st,start_st, bit_0, bit_1, bit_2, bit_3 , bit_4, bit_5, bit_6, bit_7, stop_1, stop_2);
    SIGNAL cstate_s : state_name := idle_st;
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i,rb_i,cstate_s,brd_i, dv_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= wait_s;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN wait_s     => IF(dv_i = '1') THEN cstate_s <= idle_st; END IF;
                WHEN idle_st    => IF(brd_i = '1') THEN cstate_s <= start_st;END IF;
                WHEN start_st	=> IF(brd_i = '1') THEN cstate_s <= bit_0;END IF;
                WHEN bit_0		=> IF(brd_i = '1') THEN cstate_s <= bit_1; END IF;
                WHEN bit_1		=> IF(brd_i = '1') THEN cstate_s <= bit_2; END IF;
                WHEN bit_2		=> IF(brd_i = '1') THEN cstate_s <= bit_3; END IF;
                WHEN bit_3		=> IF(brd_i = '1') THEN cstate_s <= bit_4; END IF;
                WHEN bit_4		=> IF(brd_i = '1') THEN cstate_s <= bit_5; END IF;
                WHEN bit_5		=> IF(brd_i = '1') THEN cstate_s <= bit_6; END IF;
                WHEN bit_6		=> IF(brd_i = '1') THEN cstate_s <= bit_7; END IF;
                WHEN bit_7		=> IF(brd_i = '1') THEN cstate_s <= stop_1; END IF;
                WHEN stop_1		=> IF(brd_i = '1') THEN cstate_s <= stop_2;END IF;
                WHEN stop_2		=> IF(done_i = '1') THEN cstate_s <= wait_s; 
				                   ELSIF(brd_i = '1') THEN cstate_s <= idle_st; END IF;
            END CASE;	  
        END IF;
    END PROCESS clocked;
----------------------------------------------------------------------------------------------------------------------------------------------

    task : PROCESS(cstate_s)
    BEGIN 
        CASE cstate_s IS
            WHEN wait_s     =>  en_o <= '0'; cl_o <= '1';
            WHEN idle_st    =>  en_o <= '1'; cl_o <= '0'; 
            WHEN start_st   =>  en_o <= '1'; cl_o <= '0'; 
            WHEN bit_0 	    =>  en_o <= '1'; cl_o <= '0'; 
            WHEN bit_1	    =>  en_o <= '1'; cl_o <= '0'; 
            WHEN bit_2	    =>  en_o <= '1'; cl_o <= '0'; 
            WHEN bit_3    	=>  en_o <= '1'; cl_o <= '0'; 
            WHEN bit_4 	    =>  en_o <= '1'; cl_o <= '0';
            WHEN bit_5	    =>  en_o <= '1'; cl_o <= '0';
            WHEN bit_6	    =>  en_o <= '1'; cl_o <= '0';
            WHEN bit_7	    =>  en_o <= '1'; cl_o <= '0';
            WHEN stop_1	    =>  en_o <= '1'; cl_o <= '0';
            WHEN stop_2	    =>  en_o <= '1'; cl_o <= '0';
            WHEN OTHERS	    =>  en_o <= '0'; cl_o <= '1';
        END CASE;
    END PROCESS task;
END arch;
