ARCHITECTURE a1 OF TB_brd_gen IS

    COMPONENT brd_generator_c IS PORT
    (
        rb_i, cp_i,sel_i  : IN STD_LOGIC;
        brd_o, clk_1k_o ,sec_o, secp_o : OUT STD_LOGIC
    );
    END COMPONENT;

    FOR ALL : brd_generator_c USE ENTITY WORK.brd_generator_e(brd_generator_a);

    SIGNAL rb_s,cp_s, sel_s   : STD_LOGIC;
    --SIGNAL en_i        : STD_LOGIC;
   
    --SIGNAL q31_o,co1_o : STD_LOGIC;
    --SIGNAL q32_o,co2_o : STD_LOGIC;
    --SIGNAL q33_o,co3_o : STD_LOGIC;
    SIGNAL brd_s, clk_1k_s, sec_s, secp_s : STD_LOGIC;
--
BEGIN

    uun4 : brd_generator_c PORT MAP (rb_s, cp_s, sel_s, brd_s, clk_1k_s, sec_s, secp_s);
    --
    doTB : PROCESS

    VARIABLE dotimes : INTEGER := 0;
    VARIABLE so_long : INTEGER := 200000;
    BEGIN
        rb_s <= '1';
        --en_i <= '0';
        cp_s <= '0';
        WAIT FOR 20 NS;
        sel_s <= '0';
--------------------------------------------------------------------------
        rb_s <= '0';cp_s <= '1'; WAIT FOR 20 NS;cp_s <= '0'; WAIT FOR 20 NS;
        rb_s <= '1';cp_s <= '1'; WAIT FOR 20 NS;cp_s <= '0'; WAIT FOR 20 NS;


-------------------------------------------------------------------------
        FOR dotimes IN 1 TO so_long LOOP
            cp_s <= '1'; WAIT FOR 20 NS;cp_s <= '0'; WAIT FOR 20 NS;
            --en_i <= '1'; WAIT FOR 100 NS;
        END LOOP;


        WAIT;
END PROCESS doTB;

END a1;
