ARCHITECTURE ar1 OF c10ec IS
    CONSTANT s0 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
    CONSTANT s1 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
    CONSTANT s2 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
    CONSTANT s3 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
    CONSTANT s4 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    CONSTANT s5 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
    CONSTANT s6 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
    CONSTANT s7 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
    CONSTANT s8 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
    CONSTANT s9 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";

    SIGNAL state_s : STD_LOGIC_VECTOR(3 DOWNTO 0) := s0;
BEGIN
    counter : PROCESS(rb_i,cp_i)
    BEGIN
        IF(rb_i='0') then state_s <= s0;
        ELSIF(cp_i = '1' AND cp_i'EVENT AND cp_i'LAST_VALUE = '0') THEN
            IF(cl_i = '1') THEN state_s <= s0;
            ELSE
                CASE state_s IS
                    WHEN s0 => IF(en_i='1') THEN state_s <= s1;END IF;
                    WHEN s1 => IF(en_i='1') THEN state_s <= s2;END IF;
                    WHEN s2 => IF(en_i='1') THEN state_s <= s3;END IF;
                    WHEN s3 => IF(en_i='1') THEN state_s <= s4;END IF;
                    WHEN s4 => IF(en_i='1') THEN state_s <= s5;END IF;
                    WHEN s5 => IF(en_i='1') THEN state_s <= s6;END IF;
                    WHEN s6 => IF(en_i='1') THEN state_s <= s7;END IF;
                    WHEN s7 => IF(en_i='1') THEN state_s <= s8;END IF;
                    WHEN s8 => IF(en_i='1') THEN state_s <= s9;END IF;
                    WHEN s9 => IF(en_i='1') THEN state_s <= s0;END IF;
                    WHEN others => state_s <= s0;
                END CASE;
            END IF;
        END IF;
    END PROCESS counter;
--------------------------------------------------------------------------------------
q3_o <= state_s(3);
co_o <= state_s(3) AND NOT state_s(2) AND NOT state_s(1) AND state_s(0) AND en_i;
END ar1;

