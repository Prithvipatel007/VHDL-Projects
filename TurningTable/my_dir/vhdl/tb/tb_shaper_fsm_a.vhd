   
ARCHITECTURE arch OF tb_shaper_fsm_e IS

    COMPONENT shape_fsm IS 
    PORT(
        rb_i     : IN STD_LOGIC;
        cp_i     : IN STD_LOGIC;
        s_i      : IN STD_LOGIC;
        clk_1k_i : IN STD_LOGIC;
        secp_i   : IN STD_LOGIC;
        cl_o     : OUT STD_LOGIC;
        gate_o   : OUT STD_LOGIC;
        dv_o     : OUT STD_LOGIC);
    END COMPONENT; 

    FOR ALL : shape_fsm USE ENTITY WORK.shaper_fsm_e(arch);

    SIGNAL rb_s, cp_s, s_s, clk_1k_s, secp_s, cl_s, gate_s, dv_s : STD_LOGIC;

BEGIN
    uu1 : shape_fsm PORT MAP(rb_s, cp_s, s_s, clk_1k_s, secp_s, cl_s, gate_s, dv_s );
    clock : PROCESS
        VARIABLE dotimes : INTEGER := 0;
        VARIABLE to_long : INTEGER := 30;
        VARIABLE so_long : INTEGER := 100;
        VARIABLE itimes  : INTEGER := 2;
    BEGIN
------------------------INITIALIZATION---------------------------------------
    rb_s <= '1';
    cp_s <= '0';
    s_s <= '0';
    clk_1k_s <= '0';
    secp_s <= '0';
------------------------OPERATION--------------------------------------------
    rb_s <= '0';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    rb_s <= '1';  cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
    FOR i IN 1 TO itimes LOOP
        s_s <= '1';cp_s <= '1'; WAIT FOR 20 NS; s_s <= '0'; cp_s <= '0'; WAIT FOR 20 NS;
        FOR dotimes IN 1 TO to_long LOOP
            clk_1k_s <= '1'; cp_s <= '1';  WAIT FOR 20 NS; clk_1k_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
            cp_s <= '1';   WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
        END LOOP; 
        END LOOP;
WAIT;
END PROCESS clock;
END arch;
