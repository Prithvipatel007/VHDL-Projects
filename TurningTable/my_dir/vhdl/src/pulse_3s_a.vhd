ARCHITECTURE arch OF pulse_3s_e IS 
    CONSTANT  s0 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    CONSTANT s1 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "001";
    CONSTANT s2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";

    SIGNAL state_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    count_3 : PROCESS(rb_i, cp_i, sec_i)
    BEGIN
        IF(rb_i = '0') THEN state_s <= s0;
        ELSIF(cp_i = '1' AND cp_i'EVENT AND cp_i'LAST_VALUE = '0') THEN
            IF(cl_i = '1') THEN state_s <= s0;
            ELSE
                CASE state_s IS
                    WHEN s0 => IF(sec_i = '1')THEN state_s <= s1; END IF;
                    WHEN s1 => IF(sec_i = '1') THEN state_s <= s2; END IF;
                    WHEN s2 => IF(sec_i = '1') THEN state_s <= s0; END IF;
                    WHEN OTHERS => state_s <= s0;
                END CASE;
            END IF;
        END IF;
    END PROCESS count_3;

pul_3s_o <= NOT state_s(2) AND state_s(1) AND NOT state_s (0) AND sec_i;
END arch;