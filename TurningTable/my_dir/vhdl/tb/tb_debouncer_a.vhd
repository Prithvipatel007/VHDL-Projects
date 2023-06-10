ARCHITECTURE arch OF TB_debouncer_e IS

    COMPONENT debouncer_t IS
    PORT(
        rb_i  : IN STD_LOGIC;
        cp_i  :	IN STD_LOGIC;
        rs_i  :	IN STD_LOGIC;
        en_i  : IN STD_LOGIC; 		---1K signal
        secp_i  :  IN STD_LOGIC;
        cl_o   :  OUT STD_LOGIC;
        gate_o  :  OUT STD_LOGIC;
        dv_o  :  OUT STD_LOGIC
    );
    END COMPONENT;

    FOR ALL : debouncer_t USE ENTITY WORK.debouncer_e;

     SIGNAL rb_s	: STD_LOGIC;
     SIGNAL cp_s	: STD_LOGIC;
     SIGNAL rs_s	: STD_LOGIC;
     SIGNAL en_s	: STD_LOGIC; 		---1K signal
     SIGNAL secp_s  : STD_LOGIC;
     SIGNAL cl_s 	: STD_LOGIC;
     SIGNAL gate_s	:  STD_LOGIC;
     SIGNAL dv_s	: 	 STD_LOGIC;

BEGIN 

    uu1 : debouncer_t PORT MAP(rb_s, cp_s, rs_s, en_s, secp_s,cl_s, gate_s, dv_s);
    clock : process
        VARIABLE dotimes : INTEGER := 0;
        VARIABLE to_long : INTEGER := 30;
        VARIABLE so_long : INTEGER := 200;
        VARIABLE itimes  : INTEGER := 4;
    begin
----------------------Initialization of signals-----------------------------------
        rb_s <= '1';
        cp_s <= '0';
        rs_s <= '0';
        en_s <= '0';
        secp_s <= '0';

----------------------Operations of the signals-----------------------------------
        rb_s <= '0'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        rb_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
        FOR i IN 1 TO itimes LOOP
            rs_s <= '1';cp_s <= '1'; WAIT FOR 20 NS; cp_s <= '0'; WAIT FOR 20 NS;
            FOR dotimes IN 1 TO to_long LOOP
                en_s <= '1'; WAIT FOR 1 NS; cp_s <= '1';  WAIT FOR 20 NS; en_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
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
END arch;