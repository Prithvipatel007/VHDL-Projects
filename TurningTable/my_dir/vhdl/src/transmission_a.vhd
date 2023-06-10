ARCHITECTURE arch OF transmission_e IS

    COMPONENT mux4x8_e IS
        PORT(
            digit3_i      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit2_i      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit1_i      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit0_i      : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            cr_i          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            lf_i          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            seld_i        : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            ascii_digit_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT;
	
    COMPONENT mux16_txd_e IS
        PORT(
            ascii_digit_i : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            seld_i        : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            txd_o         : OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT uart_ctrl_e IS 
        PORT(	
            rb_i   : IN STD_LOGIC;
            cp_i   : IN STD_LOGIC;	
            brd_i  : IN STD_LOGIC;
            done_i : IN STD_LOGIC;
            dv_i   : IN STD_LOGIC;
            en_o   : OUT STD_LOGIC;
            cl_o   : OUT STD_LOGIC);
    END COMPONENT;
	
    COMPONENT Cnt3_e IS
        PORT(
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            en_i    : IN STD_LOGIC;
            cl_i    : IN STD_LOGIC;
            co_o    : OUT STD_LOGIC;
            q_o     : OUT STD_LOGIC_VECTOR(2 DOWNTO 0));
    END COMPONENT;
	
    COMPONENT Cnt4_e IS
        PORT(
            rb_i    : IN STD_LOGIC;
            cp_i    : IN STD_LOGIC;
            en_i    : IN STD_LOGIC;
            cl_i    : IN STD_LOGIC;
            co_o    : OUT STD_LOGIC;
            q_o     : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
---------------------------------------------------------------------------------------------------------------------------------------------------
--Internal signals
SIGNAL seld3_s : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL seld4_s : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ascii_ms : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL txd_s : STD_LOGIC;
SIGNAL en1_s,cl1_s : STD_LOGIC;
SIGNAL co4_s,co3_s, en2_s, en3_s, en4_s : STD_LOGIC;

BEGIN
    uu1 : mux4x8_e 
	      PORT MAP(digit3_i,digit2_i,digit1_i,digit0_i,cr_i,lf_i,seld3_s,ascii_ms);
    uu2 : mux16_txd_e PORT MAP(ascii_ms,seld4_s,txd_s);
    uu3 : uart_ctrl_e PORT MAP(rb_i,cp_i,brd_i,co3_s,dv_i,en1_s,cl1_s);
    en2_s <= brd_i AND en1_s;
    uu5 : cnt4_e PORT MAP(rb_i, cp_i, en2_s,cl1_s,co4_s,seld4_s);
    en4_s <= en2_s AND co4_s;
    uu6 : cnt3_e PORT MAP(rb_i,cp_i, en4_s,cl1_s,co3_s,seld3_s);
    txd_o <= txd_s;

END arch;
