ARCHITECTURE arch_a OF shaper_e IS
    CONSTANT s0 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
    CONSTANT s1 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
    CONSTANT s2 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
    CONSTANT s3 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00011";
    CONSTANT s4 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
    CONSTANT s5 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00101";
    CONSTANT s6 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00110";
    CONSTANT s7 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00111";
    CONSTANT s8 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
    CONSTANT s9 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01001";
    CONSTANT s10 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01010";
    CONSTANT s11 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01011";
    CONSTANT s12 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01100";
    CONSTANT s13 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01101";
    CONSTANT s14 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01110";
    CONSTANT s15 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01111";
    CONSTANT s16 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10000";
    CONSTANT s17 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10001";
    CONSTANT s18 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10010";
    CONSTANT s19 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10011";
    CONSTANT s20 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10100";
    CONSTANT s21 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10101";
    CONSTANT s22 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10110";
    CONSTANT s23 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "10111";
    CONSTANT s24 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "11000";
    CONSTANT s25 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "11001";


    SIGNAL state_s : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
    state : PROCESS(rb_i,cp_i)
    BEGIN
        IF(rb_i='0') then state_s <= s0;
        ELSIF(cp_i = '1' AND cp_i'EVENT AND cp_i'LAST_VALUE = '0') THEN
            CASE state_s IS
                WHEN s0 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s1; 
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s1 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s2;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s2 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s3;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s3 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s4;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s4 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s5;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s5 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s6;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s6 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s7;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s7 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s8;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s8 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s9;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s9 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s10;
				           ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
						   
                WHEN s10 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s11;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s11 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s12;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s12 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s13;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s13 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s14;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							 
                WHEN s14 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s15;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s15 => IF(en_i='1'AND rs_i = '1') THEN state_s <= s16;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s16 => IF(en_i='1' AND rs_i = '1') THEN state_s <= s17;
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s17 => IF(en_i='1' AND rs_i = '1') THEN state_s <= s18; 
				            ELSIF(rs_i = '0')THEN state_s <= s0; END IF;
							
                WHEN s18 => IF(rs_i = '0') THEN state_s <= s0; END IF;
                --WHEN s18 => IF(en_i='1') THEN state_s <= s19;END IF;
                WHEN OTHERS => state_s <= s0;
            END CASE;
        END IF;
    END PROCESS state;
--------------------------------------------------------------------------------------
--s_o <=  state_s(4) AND NOT state_s(3) AND NOT state_s(2) AND NOT state_s(1) AND state_s(0) AND en_i;
s_o <= '1' WHEN ((state_s = s17) AND (en_i = '1')) ELSE '0';
END arch_a;
