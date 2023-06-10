ARCHITECTURE a1 OF TB_top_level IS 

    COMPONENT tp_t IS PORT(
        rb_i	:  IN STD_LOGIC;
        cp_i   :  IN STD_LOGIC;
        rs_i   :  IN STD_LOGIC;
        sw_i   :  IN STD_LOGIC;
        sec_o  :  OUT STD_LOGIC;
        gate_o :  OUT STD_LOGIC;
        rs_o   :  OUT STD_LOGIC;
        txd_o  :  OUT STD_LOGIC
    );
    END  COMPONENT;

    FOR ALL : tp_t USE ENTITY WORK.top_level(a2);

-- ---------------------------------------------------------------------------------------------------	
    SIGNAL rb_s,cp_s,rs_s,sw_s          : STD_LOGIC;
    SIGNAL sec_s, gate_s, rs_os, txd_s   : STD_LOGIC;

BEGIN

    uu1: tp_t PORT MAP (rb_s, cp_s, rs_s, sw_s, sec_s, gate_s, rs_os, txd_s);


    clkx : PROCESS
        VARIABLE dotimes : INTEGER := 0;
        VARIABLE to_long : INTEGER := 300000;
        VARIABLE so_long : INTEGER := 12500000;
        VARIABLE itimes  : INTEGER := 4;		
    BEGIN
-----------------------Initialization of signals-------------------------------
        rb_s <= '1';
        cp_s <= '0';
        rs_s <= '0';
        sw_s <= '0';
----------------------Operations of signals-----------------------------------

        rb_s <= '0';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        rb_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        FOR i IN 1 TO  itimes LOOP
            rs_s <= '1';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
            FOR dotimes IN 1 TO to_long LOOP
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            END LOOP;
            rs_s <= '0'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
            FOR dotimes IN 1 TO so_long LOOP
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
                cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            END LOOP;
        END LOOP;

WAIT;
END PROCESS clkx;

END a1;
