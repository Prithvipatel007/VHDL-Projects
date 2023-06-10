ARCHITECTURE arch OF TB_transmission_e IS
	COMPONENT uart_t IS 
		PORT(
				rb_i 		:	IN STD_LOGIC;
				cp_i		:	IN STD_LOGIC;
				digit3_i	: 	IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
				digit2_i	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				digit1_i	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				digit0_i	:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				cr_i		:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
				lf_i		:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				brd_i		:	IN STD_LOGIC;
				dv_i		: 	IN STD_LOGIC;
				txd_o		:	OUT STD_LOGIC
		);
END COMPONENT;

  FOR ALL : uart_t USE ENTITY WORK.transmission_e(arch);

SIGNAL rb_s 	:	STD_LOGIC;
SIGNAL cp_s		:	STD_LOGIC;
SIGNAL digit3_s	: 	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110001";			
SIGNAL digit2_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00111000";
SIGNAL digit1_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110000";
SIGNAL digit0_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00110000";
SIGNAL cr_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00001101";
SIGNAL lf_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0) := "00001010";
SIGNAL brd_s	:	STD_LOGIC;
SIGNAL dv_s		: 	STD_LOGIC;
SIGNAL txd_s	:	STD_LOGIC;

BEGIN	

	uu1 : uart_t PORT MAP(rb_s, cp_s, digit3_s, digit2_s, digit1_s, digit0_s, cr_s, lf_s, brd_s, dv_s, txd_s);
	
	clock : PROCESS 
		VARIABLE dotimes : INTEGER := 0;
		VARIABLE so_long : INTEGER := 200;
	BEGIN
------------------------------Initialization of signals--------------------------------------------
		rb_s <= '1';
		cp_s <= '0';
		brd_s <= '0';
		dv_s <= '0';
		
------------------------------Operation of signals------------------------------------------------
		
		rb_s <= '0';  WAIT FOR 20 NS; rb_s <= '1';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	    cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
      	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		dv_s <= '1';  brd_s <= '1';  cp_s <= '1';  WAIT FOR 20 NS; dv_s <= '0';brd_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
	    cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
	    cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
      	cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		FOR dotimes IN 1 TO so_long LOOP
			brd_s <= '1'; WAIT FOR 1 NS; cp_s <= '1';  WAIT FOR 20 NS; brd_s <= '0'; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		    cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
			cp_s <= '1';  WAIT FOR 20 NS; cp_s <= '0';  WAIT FOR 20 NS;
		END LOOP;
		WAIT;
	END PROCESS clock;
END arch;