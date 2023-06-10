ARCHITECTURE ar1 OF c05ec IS
    CONSTANT s0 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "000";
    CONSTANT s1 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "001";
    CONSTANT s2 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "010";
    CONSTANT s3 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "011";
    CONSTANT s4 : STD_LOGIC_VECTOR(2 DOWNTO 0) := "100";

    SIGNAL state_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
    counter : PROCESS(rb_i,cp_i,en_i)
    BEGIN
        IF(rb_i='0') THEN state_s <= s0;
        ELSIF(cp_i = '1' AND cp_i'EVENT AND cp_i'LAST_VALUE = '0') THEN
            IF(cl_i = '1') THEN state_s <= s0;
            ELSE
                CASE state_s IS
                    WHEN s0 => IF(en_i='1') THEN state_s <= s1;END IF;
                    WHEN s1 => IF(en_i='1') THEN state_s <= s2;END IF;
                    WHEN s2 => IF(en_i='1') THEN state_s <= s3;END IF;
                    WHEN s3 => IF(en_i='1') THEN state_s <= s4;END IF;
                    WHEN s4 => IF(en_i='1') THEN state_s <= s0;END IF;
                    WHEN OTHERS => state_s <= s0;
                END CASE;
            END IF;
        END IF;
END PROCESS counter;
--------------------------------------------------------------------------------------
q3_o <= state_s(2);
co_o <= state_s(2) AND NOT state_s(1) AND NOT state_s(0) AND en_i;
END ar1;
