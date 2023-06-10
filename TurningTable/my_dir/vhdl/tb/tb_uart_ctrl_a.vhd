ARCHITECTURE arch OF tb_uart_ctrl_fsm_e IS
	COMPONENT uart_fsm IS
		PORT(
			rb_i   : IN STD_LOGIC;
			cp_i   : IN STD_LOGIC;	
			brd_i  : IN STD_LOGIC;
			dv_i   : IN STD_LOGIC;
			done_i : IN STD_LOGIC;
			en_o   : OUT STD_LOGIC;
			cl_o   : OUT STD_LOGIC);
	END COMPONENT;
	
	FOR ALL : uart_fsm USE ENTITY WORK.uart_ctrl_e(arch);
	
	SIGNAL rb_s, cp_s, brd_s, dv_s, done_s, en_s, cl_s : STD_LOGIC;
BEGIN
	uu1 : uart_fsm PORT MAP(rb_s, cp_s, brd_s, dv_s, done_s, en_s, cl_s);
	clock : PROCESS
		VARIABLE dotimes : INTEGER := 0;
		VARIABLE so_long : INTEGER := 10;
	BEGIN
------------------------------Initialization of signals--------------------------------------------
		rb_s <= '1';
		cp_s <= '0';
		brd_s <= '0';
		dv_s <= '0';
		done_s <= '0';
------------------------------Operation of signals------------------------------------------------
		
		rb_s <= '0';  WAIT FOR 1 NS;cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		rb_s <= '1';  WAIT FOR 1 NS;cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	    	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	      	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		dv_s <= '1';  cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		brd_s <= '1'; cp_s <= '1';  WAIT FOR 20 NS; brd_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
		dv_s <= '0';  cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	    	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	      	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		FOR dotimes IN 1 TO so_long LOOP
			brd_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; brd_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		END LOOP;
		done_s <= '1'; cp_s <= '1';  WAIT FOR 20 NS; done_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		brd_s <= '1'; cp_s <= '1'; WAIT FOR 20 NS; brd_s <= '0';cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; brd_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;	
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		WAIT;
	END PROCESS clock;
END arch;
