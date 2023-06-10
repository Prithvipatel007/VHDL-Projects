ARCHITECTURE a1 OF c16ec IS
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
    CONSTANT s10 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
    CONSTANT s11 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
    CONSTANT s12 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
    CONSTANT s13 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
    CONSTANT s14 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
    CONSTANT s15 : STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";

    SIGNAL state_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
    counter : PROCESS(rb_i,cp_i)
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
                    WHEN s4 => IF(en_i='1') THEN state_s <= s5;END IF;
                    WHEN s5 => IF(en_i='1') THEN state_s <= s6;END IF;
                    WHEN s6 => IF(en_i='1') THEN state_s <= s7;END IF;
                    WHEN s7 => IF(en_i='1') THEN state_s <= s8;END IF;
                    WHEN s8 => IF(en_i='1') THEN state_s <= s9;END IF;
                    WHEN s9 => IF(en_i='1') THEN state_s <= s10;END IF; 
                    WHEN s10 => IF(en_i='1') THEN state_s <= s11;END IF;
                    WHEN s11 => IF(en_i='1') THEN state_s <= s12;END IF;
                    WHEN s12 => IF(en_i='1') THEN state_s <= s13;END IF;
                    WHEN s13 => IF(en_i='1') THEN state_s <= s14;END IF;
                    WHEN s14 => IF(en_i='1') THEN state_s <= s15;END IF;
                    WHEN s15 => IF(en_i='1') THEN state_s <= s0;END IF;
                    WHEN OTHERS => state_s <= s0;
                END CASE;
            END IF;
        END IF;
    END PROCESS counter;
--------------------------------------------------------------------------------------
q3_o <= state_s(3);
co_o <= state_s(3) AND state_s(2) AND state_s(1) AND state_s(0) AND en_i;
END a1;

