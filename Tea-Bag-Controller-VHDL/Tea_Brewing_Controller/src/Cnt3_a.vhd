----------------------------------------------------------------------------------------------------
ARCHITECTURE arch OF Cnt3_e IS
    TYPE state_name_T IS (s0,s1,s2,s3,s4,s5, s6, s7);
    SIGNAL state_s : state_name_T;
BEGIN

    clk : PROCESS(rb_i,cp_i,en_i,state_s)
    BEGIN
        IF(rb_i = '0') THEN state_s <= s0;
        ELSIF(cp_i'EVENT AND cp_i = '1' AND cp_i'LAST_VALUE='0') THEN
            CASE state_s IS
                WHEN s0 => IF(en_i = '1') THEN state_s <= s1;END IF;
                WHEN s1 => IF(en_i = '1') THEN state_s <= s2;END IF;
                WHEN s2 => IF(en_i = '1') THEN state_s <= s3;END IF;
                WHEN s3 => IF(en_i = '1') THEN state_s <= s4;END IF;
                WHEN s4 => IF(en_i = '1') THEN state_s <= s5;END IF;
                WHEN s5 => IF(en_i = '1') THEN state_s <= s6;END IF;
                WHEN s6 => IF(en_i = '1') THEN state_s <= s7;END IF;
                WHEN s7 => IF(en_i = '1') THEN state_s <= s0;END IF;
            END CASE;
        END IF;
        IF(cl_i = '1') THEN state_s <= s0; END IF;
    END PROCESS clk;

    aufgabe : PROCESS(state_s)
    BEGIN
        CASE state_s IS 
            WHEN s0 => q_o(0)<='0';q_o(1)<='0';q_o(2)<='0';
            WHEN s1 => q_o(0)<='1';q_o(1)<='0';q_o(2)<='0';
            WHEN s2 => q_o(0)<='0';q_o(1)<='1';q_o(2)<='0';
            WHEN s3 => q_o(0)<='1';q_o(1)<='1';q_o(2)<='0';
            WHEN s4 => q_o(0)<='0';q_o(1)<='0';q_o(2)<='1';
            WHEN s5 => q_o(0)<='1';q_o(1)<='0';q_o(2)<='1';
            WHEN s6 => q_o(0)<='0';q_o(1)<='1';q_o(2)<='1';
            WHEN s7 => q_o(0)<='1';q_o(1)<='1';q_o(2)<='1';
        END CASE;
     END PROCESS aufgabe;
co_o <= '1' WHEN (state_s = s7) ELSE '0';
END arch;
