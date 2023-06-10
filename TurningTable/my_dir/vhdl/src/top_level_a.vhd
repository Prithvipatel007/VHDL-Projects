ARCHITECTURE a2 OF top_level IS 
    COMPONENT debouncer_e IS
        PORT(
            rb_i    :   IN STD_LOGIC;
            cp_i    :   IN STD_LOGIC;
            rs_i    :   IN STD_LOGIC;
            en_i    :   IN STD_LOGIC;
            secp_i  :   IN STD_LOGIC;
            cl_o    :   OUT STD_LOGIC;
            gate_o  :   OUT STD_LOGIC;
            dv_o    :   OUT STD_LOGIC);	
    END  COMPONENT;

    COMPONENT BCD_to_ASCII_e IS
        PORT(
            digit0_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit1_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit2_i : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit3_i : IN STD_LOGIC_VECTOR(3  DOWNTO 0);
            digit3_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit2_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit1_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit0_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            cr_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            lf_o : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
        END COMPONENT;

    COMPONENT bcd_cnt4_4_e IS 
        PORT(
            rb_i     : IN STD_LOGIC;   -- global reset
            cp_i     : IN STD_LOGIC; -- system clock
            clk_1k_i : IN STD_LOGIC; --- 1 KHz clock used for 4 digit counter
            en_i     : IN STD_LOGIC; -- enable
            clr_i    : IN STD_LOGIC;  -- clear
            digit_0_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); 
            digit_1_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit_2_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            digit_3_o: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
        END COMPONENT;

    COMPONENT transmission_e IS 
        PORT(
            rb_i        :   IN STD_LOGIC;
            cp_i        :   IN STD_LOGIC;
            digit3_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
            digit2_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit1_i    :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            digit0_i	:   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            cr_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);			
            lf_i        :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            brd_i       :   IN STD_LOGIC;
            dv_i        :   IN STD_LOGIC;
            txd_o       :   OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT brd_generator_e IS 
        PORT(
            rb_i, cp_i, sel_i               :   IN STD_LOGIC;
            brd_o, clk_1k_o,sec_o, secp_o   :   OUT STD_LOGIC);
    END COMPONENT;

--	SIGNAL clk_1k_s : STD_LOGIC;
    SIGNAL gate_s, dv_s : STD_LOGIC;
    SIGNAL digit0_s: STD_LOGIC_VECTOR(3 DOWNTO 0); 
    SIGNAL digit1_s: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL digit2_s: STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL digit3_s: STD_LOGIC_VECTOR(3 DOWNTO 0); 
    SIGNAL adigit0_s: STD_LOGIC_VECTOR(7 DOWNTO 0); 
    SIGNAL adigit1_s: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL adigit2_s: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL adigit3_s: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL cr_s: STD_LOGIC_VECTOR(7 DOWNTO 0); 
    SIGNAL lf_s: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL brd_s,clk_1k_s : STD_LOGIC;
    SIGNAL sec_s, secp_s : STD_LOGIC;
    SIGNAL txd_s,cl_s : STD_LOGIC;

BEGIN
    baud_rate_9k6 : brd_generator_e 
	    PORT MAP(rb_i, cp_i, sw_i, brd_s, clk_1k_s , sec_s, secp_s);
					
    sensor_dt : debouncer_e 
	    PORT MAP(rb_i, cp_i, rs_i, clk_1k_s, secp_s ,cl_s ,gate_s, dv_s);
				
    bcd_counter : bcd_cnt4_4_e 
	    PORT MAP(rb_i, cp_i, clk_1k_s, gate_s,cl_s ,digit0_s, digit1_s, digit2_s, digit3_s);
		
    bcd_ascii : BCD_to_ASCII_e 
	    PORT MAP(digit0_s, digit1_s, digit2_s, digit3_s, 
		         adigit3_s, adigit2_s, adigit1_s, adigit0_s, cr_s, lf_s);
		
    transmit_data : transmission_e 
	    PORT MAP(rb_i, cp_i, adigit3_s, adigit2_s, adigit1_s, adigit0_s, cr_s, lf_s, brd_s, dv_s, txd_s);

txd_o <= txd_s;
sec_o <= sec_s;
gate_o <= gate_s;
rs_o <= rs_i;


END a2;
