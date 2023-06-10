ARCHITECTURE tb_Cnt4_a OF tb_Cnt4_e IS

    COMPONENT count_t IS
        PORT(
            rb_i     : IN STD_LOGIC;   -- global reset
            cp_i     : IN STD_LOGIC; -- system clock
            clk_1k_i : IN STD_LOGIC; --- 1 KHz clock used for 4 digit counter
            en_i     : IN STD_LOGIC; -- enable
            clr_i    : IN STD_LOGIC;  -- clear
            digit_0_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
            digit_1_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit_2_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit_3_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    FOR ALL : count_t USE ENTITY WORK.bcd_cnt4_4_e(bcd_cnt4_4_a);

    SIGNAL rb_s     : STD_LOGIC;   -- global reset
    SIGNAL cp_s     : STD_LOGIC; -- system clock
    SIGNAL clk_1k_s : STD_LOGIC; --- 1 KHz clock used for 4 digit counter
    SIGNAL en_s     : STD_LOGIC; -- enable
    SIGNAL clr_s    : STD_LOGIC;  -- clear
    SIGNAL digit_0_s: STD_LOGIC_VECTOR(3 DOWNTO 0); 
    SIGNAL digit_1_s: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL digit_2_s: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL digit_3_s: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    uut: count_t PORT MAP (rb_s, cp_s, clk_1k_s, en_s, clr_s, digit_0_s, digit_1_s, digit_2_s, digit_3_s);       
  
    clock : process
    VARIABLE dotimes : INTEGER := 0;
    VARIABLE so_long : INTEGER := 600;
     BEGIN

        cp_s <= '0';
        clk_1k_s <= '0';
        en_s <= '0';
        clr_s <= '0'; 

        rb_s <= '0'; WAIT FOR 20 NS; 

        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        rb_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;

        en_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;

        FOR dotimes IN 1 TO so_long LOOP
            clk_1k_s <= '1'; cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            clk_1k_s <= '0'; cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            clk_1k_s <= '1'; cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            clk_1k_s <= '0'; cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;

        END LOOP;

        en_s <= '0'; cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
WAIT;

END PROCESS clock;

END tb_Cnt4_a;