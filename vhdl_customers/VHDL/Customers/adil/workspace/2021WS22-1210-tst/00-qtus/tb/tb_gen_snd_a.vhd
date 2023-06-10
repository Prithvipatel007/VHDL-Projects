ARCHITECTURE tb_gen_snd_a OF tb_gen_snd_e IS

COMPONENT gen_snd_e IS
PORT (rb_i     :  IN STD_LOGIC;                   -- Reset, when low
	  cp_i     :  IN STD_LOGIC;                   -- Syscp
	  off_btn_i:  IN STD_LOGIC;
	   d_i     :  IN STD_LOGIC_VECTOR(7 DOWNTO 0);-- start, when 'E'
	  dv_i     :  IN STD_LOGIC;                   -- d_i is valid
	  s0_i     :  IN STD_LOGIC;                   -- 00:2min,01:3min
	  s1_i     :  IN STD_LOGIC;                   -- 10:4min,11:5min
	 ci1_i     :  IN STD_LOGIC;                   -- one second
	 sig_1k_i  :   IN  STD_LOGIC;                 -- 1k signal
	 snd_o     : OUT STD_LOGIC);                  -- sound output
END COMPONENT gen_snd_e;
	
	SIGNAL rb_s    		: STD_LOGIC;
	SIGNAL cp_s    		: STD_LOGIC;
	SIGNAL off_btn_s		: STD_LOGIC;
	SIGNAL d_s    	:   std_logic_vector(7 downto 0);
	SIGNAL dv_s    		: STD_LOGIC;
	SIGNAL s0_s   : STD_LOGIC;
	SIGNAL s1_s   : STD_LOGIC;
	SIGNAL ci1_s   : STD_LOGIC;
	SIGNAL sig_1k_s   : STD_LOGIC;
	SIGNAL snd_s       : STD_LOGIC;

    
--
BEGIN

    uun4 : gen_snd_e PORT MAP (
		
		rb_s    	     ,
		cp_s    	     ,
		off_btn_s	     ,
		d_s       		 ,
		dv_s   			 ,
		s0_s             ,
		s1_s             ,
		ci1_s            ,
		sig_1k_s         ,
		snd_s       
	);
    --
    doTB : PROCESS
    BEGIN
		off_btn_s <= '0';
        d_s <= "11111111";
        dv_s <= '1';
        s0_s <= '0';
        s1_s <= '0';
        WAIT FOR 500 us;
		off_btn_s <= '1';
        WAIT;
    END PROCESS doTB;

clocking_1khz : PROCESS 
begin
    sig_1k_s <= '1';
    WAIT FOR 500 us;
    sig_1k_s <= '0';
    WAIT FOR 500 us;
END PROCESS clocking_1khz;

clocking_1hz : PROCESS 
begin
    ci1_s <= '1';
    WAIT FOR 500 ms;
    ci1_s <= '0';
    WAIT FOR 500 ms;
END PROCESS clocking_1hz;

clocking : PROCESS 
begin
    cp_s <= '1';
    WAIT FOR 50 NS;
    cp_s <= '0';
    WAIT FOR 50 NS;
END PROCESS clocking;

pulse_1Hz : PROCESS 
begin
    cp_s <= '0';
    WAIT FOR 999999979 NS;
    cp_s <= '1';
    WAIT FOR 20 NS;
END PROCESS pulse_1Hz;

reseting : PROCESS
begin
    rb_s <= '0';
    WAIT FOR 50 NS;
    rb_s <= '1';
    WAIT;
end process reseting;



END tb_gen_snd_a;
