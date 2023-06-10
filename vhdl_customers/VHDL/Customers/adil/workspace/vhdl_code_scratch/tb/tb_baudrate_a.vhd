ARCHITECTURE tb_baudrate_a OF tb_baudrate_e IS

    COMPONENT baudrate_e IS PORT
    (
        rb_i, cp_i  : IN STD_LOGIC;
        brd_o, clk_1k_o ,sec_o, secp_o : OUT STD_LOGIC
    );
    END COMPONENT;

    FOR ALL : baudrate_e USE ENTITY WORK.baudrate_e(baudrate_a);

    SIGNAL rb_s,cp_s   : STD_LOGIC;
    SIGNAL brd_s, clk_1k_s, sec_s, secp_s : STD_LOGIC;
--
BEGIN

    uun1 : baudrate_e PORT MAP (rb_s, cp_s, brd_s, clk_1k_s, sec_s, secp_s);
    --
    doTB : PROCESS

    VARIABLE dotimes : INTEGER := 0;
    VARIABLE so_long : INTEGER := 200000;
    BEGIN
        rb_s <= '1';
        cp_s <= '0';
        WAIT FOR 50 NS;
        rb_s <= '0';cp_s <= '1'; WAIT FOR 25 NS;cp_s <= '0'; WAIT FOR 25 NS;
        rb_s <= '1';cp_s <= '1'; WAIT FOR 25 NS;cp_s <= '0'; WAIT FOR 25 NS;
        FOR dotimes IN 1 TO so_long LOOP
            cp_s <= '1'; WAIT FOR 25 NS;cp_s <= '0'; WAIT FOR 25 NS;
        END LOOP;
        WAIT;
END PROCESS doTB;

END tb_baudrate_a;
