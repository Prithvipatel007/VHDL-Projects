ARCHITECTURE arch OF tb_shaper_e IS

    COMPONENT shape IS
    PORT(
        rb_i : IN STD_LOGIC;
        cp_i : IN STD_LOGIC;
        rs_i : IN STD_LOGIC;
        en_i : IN STD_LOGIC;
        s_o  : OUT STD_LOGIC);
    END COMPONENT;

    FOR ALL : shape USE ENTITY WORK.shaper_e;

    SIGNAL rb_s, cp_s, rs_s, en_s, s_s : STD_LOGIC;
BEGIN
    uu1 : shape PORT MAP(rb_s, cp_s, rs_s, en_s, s_s);

    clock : PROCESS
        VARIABLE dotimes : INTEGER := 0;
        VARIABLE to_long : INTEGER := 30;
        VARIABLE so_long : INTEGER := 200;
        VARIABLE itimes  : INTEGER := 2;
    BEGIN
---------------------INITIALIZATION FO THE SIGNALS---------------------
    rb_s <= '1';
    cp_s <= '0';
    rs_s <= '0';
    en_s <= '0';

--------------------OPERATION OF THE SIGNALS--------------------------
    rb_s <= '0';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    rb_s <= '1';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    FOR i IN 1 TO itimes LOOP
        rs_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        FOR dotimes IN 1 TO to_long LOOP
            en_s <= '1'; WAIT FOR 20 NS; cp_s <= '1';  WAIT FOR 20 NS; en_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        END LOOP;
        rs_s <= '0'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        FOR dotimes IN 1 TO so_long LOOP
            en_s <= '1'; WAIT FOR 1 NS; cp_s <= '1';  WAIT FOR 20 NS; en_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        END LOOP;
    END LOOP;
WAIT;
END PROCESS clock;

END;