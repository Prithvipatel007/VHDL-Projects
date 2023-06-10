ARCHITECTURE ar1 OF c10xc IS
    CONSTANT s0 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
    CONSTANT s1 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
    CONSTANT s2 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
    CONSTANT s3 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00011";
    CONSTANT s4 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
    CONSTANT s5 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00101";
    CONSTANT s6 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00110";
    CONSTANT s7 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00111";
    CONSTANT s8 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
    CONSTANT s9 : STD_LOGIC_VECTOR(4 DOWNTO 0) := "11001";

    SIGNAL state_s : STD_LOGIC_VECTOR(4 DOWNTO 0) := s0;
BEGIN
    counter : PROCESS(rb_i,cp_i)
    BEGIN
    IF(rb_i='0') then state_s <= s0;
    ELSIF(cp_i = '1' AND cp_i'EVENT AND cp_i'LAST_VALUE = '0') THEN
        CASE state_s IS
            WHEN s0 => state_s <= s1;
            WHEN s1 => state_s <= s2;
            WHEN s2 => state_s <= s3;
            WHEN s3 => state_s <= s4;
            WHEN s4 => state_s <= s5;
            WHEN s5 => state_s <= s6;
            WHEN s6 => state_s <= s7;
            WHEN s7 => state_s <= s8;
            WHEN s8 => state_s <= s9;
            WHEN s9 => state_s <= s0;
            WHEN OTHERS => state_s <= s0;
        END CASE;
    END IF;
    END PROCESS counter;
--------------------------------------------------------------------------------------
q3_o <= state_s(4);
co_o <= state_s(4) AND state_s(3) AND NOT state_s(2) AND NOT state_s(1) AND state_s(0) ;
END ar1;

