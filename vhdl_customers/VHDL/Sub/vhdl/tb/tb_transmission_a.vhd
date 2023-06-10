ARCHITECTURE arch OF TB_transmission_e IS
	COMPONENT transmission_e IS 
	PORT(
		rb_i        :   IN STD_LOGIC;
		cp_i        :   IN STD_LOGIC;
		hour_0_i    : IN std_logic_vector(7 downto 0);
		hour_1_i    : IN std_logic_vector(7 downto 0);
		minutes_1_i : IN std_logic_vector(7 downto 0);
		minutes_0_i : IN std_logic_vector(7 downto 0);
		seconds_1_i : IN std_logic_vector(7 downto 0);
		seconds_0_i : IN std_logic_vector(7 downto 0);
		cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
		lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		brd_i       :   IN STD_LOGIC;
		dv_i        :   IN STD_LOGIC;
		txd_o       :   OUT STD_LOGIC);
	END COMPONENT transmission_e;

SIGNAL rb_s 	:	STD_LOGIC;
SIGNAL cp_s		:	STD_LOGIC;
SIGNAL hour_0_i	: 	STD_LOGIC_VECTOR(7 DOWNTO 0);			
SIGNAL hour_1_i	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL minutes_1_i	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL minutes_0_i	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL seconds_1_i	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL seconds_0_i	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL cr_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL lf_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL brd_s	:	STD_LOGIC;
SIGNAL dv_s		: 	STD_LOGIC;
SIGNAL txd_s	:	STD_LOGIC;

BEGIN	

	uu1 : transmission_e PORT MAP(rb_s, cp_s, hour_0_i, hour_1_i, minutes_1_i, minutes_0_i, seconds_1_i, seconds_0_i, cr_s, lf_s, brd_s, dv_s, txd_s);
	
	clock : PROCESS 
		VARIABLE dotimes : INTEGER := 0;
		VARIABLE so_long : INTEGER := 200;
	BEGIN
------------------------------Initialization of signals--------------------------------------------
		rb_s <= '1';
		cp_s <= '0';
		brd_s <= '0';
		dv_s <= '0';
		hour_0_i <= "00110001";
		hour_1_i <= "00110001";
		minutes_1_i <= "00110001";
		minutes_0_i <= "00110001";
		seconds_1_i <= "00110001";
		seconds_0_i <= "00110001";
		cr_s <= "00001101";
		lf_s <= "00001010";		
		
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