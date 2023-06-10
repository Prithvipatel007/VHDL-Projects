ARCHITECTURE tb_txd_a OF tb_txd_e IS
	COMPONENT txd_e IS 
	PORT(
		rb_i        :   IN STD_LOGIC;
		cp_i        :   IN STD_LOGIC;
		h_0_i    : IN std_logic_vector(7 downto 0);
		h_1_i    : IN std_logic_vector(7 downto 0);
		m_1_i : IN std_logic_vector(7 downto 0);
		m_0_i : IN std_logic_vector(7 downto 0);
		s_1_i : IN std_logic_vector(7 downto 0);
		s_0_i : IN std_logic_vector(7 downto 0);
		cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
		lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		brd_i       :   IN STD_LOGIC;
		dv_i        :   IN STD_LOGIC;
		txd_o       :   OUT STD_LOGIC);
	END COMPONENT txd_e;

SIGNAL rb_s 	:	STD_LOGIC;
SIGNAL cp_s		:	STD_LOGIC;
SIGNAL h_0_s	: 	STD_LOGIC_VECTOR(7 DOWNTO 0);			
SIGNAL h_1_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL m_1_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL m_0_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_1_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL s_0_s	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL cr_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL lf_s		:	STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL brd_s	:	STD_LOGIC;
SIGNAL dv_s		: 	STD_LOGIC;
SIGNAL txd_s	:	STD_LOGIC;

BEGIN	

	uu1 : txd_e PORT MAP(rb_s, cp_s, h_0_s, h_1_s, m_1_s, m_0_s, s_1_s, s_0_s, cr_s, lf_s, brd_s, dv_s, txd_s);
	
	clock : PROCESS 
		VARIABLE dotimes : INTEGER := 0;
		VARIABLE so_long : INTEGER := 200;
	BEGIN
------------------------------Initialization of signals--------------------------------------------
		rb_s <= '1';
		cp_s <= '0';
		brd_s <= '0';
		dv_s <= '0';
		h_0_s <= "00110001";
		h_1_s <= "00110011";
		m_1_s <= "00110011";
		m_0_s <= "00110001";
		s_1_s <= "00110011";
		s_0_s <= "00110001";
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
END tb_txd_a;