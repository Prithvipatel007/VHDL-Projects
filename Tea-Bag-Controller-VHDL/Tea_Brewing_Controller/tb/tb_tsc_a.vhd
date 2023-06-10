ARCHITECTURE a1 OF tb_tsc_e IS

    COMPONENT tsc_e IS
    PORT(
        --
        --  Inputs
        --
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        dr_i    : IN STD_LOGIC;
        sx_i    : IN STD_LOGIC;     -- sensor input
        
        hour_0_i    :   IN std_logic_vector(3 downto 0);
        hour_1_i    :   IN std_logic_vector(3 downto 0);
        minutes_1_i :   IN std_logic_vector(3 downto 0);
        minutes_0_i :   IN std_logic_vector(3 downto 0);
        seconds_1_i :   IN std_logic_vector(3 downto 0);
        seconds_0_i :   IN std_logic_vector(3 downto 0);

        m0_i    : IN STD_LOGIC;     -- mode 0
        m1_i    : IN STD_LOGIC;     -- mode 1
        m2_i    : IN STD_LOGIC;     -- mode 2
        m3_i    : IN STD_LOGIC;     -- mode 3
        --
        -- Outputs
        --
        hour_0_o    :   OUT std_logic_vector(3 downto 0);
        hour_1_o    :   OUT std_logic_vector(3 downto 0);
        minutes_1_o :   OUT std_logic_vector(3 downto 0);
        minutes_0_o :   OUT std_logic_vector(3 downto 0);
        seconds_1_o :   OUT std_logic_vector(3 downto 0);
        seconds_0_o :   OUT std_logic_vector(3 downto 0);

        dv_o          : OUT STD_LOGIC;
        m0_state_o    : OUT STD_LOGIC;
        m1_state_o    : OUT STD_LOGIC;
        m2_state_o    : OUT STD_LOGIC;
        m3_state_o    : OUT STD_LOGIC
        );
    END COMPONENT tsc_e;

    SIGNAL rb_s    		 : STD_LOGIC;
    SIGNAL cp_s    		 : STD_LOGIC;
    SIGNAL dr_s    		 : STD_LOGIC;
    SIGNAL sx_s    		 : STD_LOGIC;     -- sensor input
    SIGNAL hour_0_i_s    : std_logic_vector(3 downto 0);
    SIGNAL hour_1_i_s    : std_logic_vector(3 downto 0);
    SIGNAL minutes_1_i_s : std_logic_vector(3 downto 0);
    SIGNAL minutes_0_i_s : std_logic_vector(3 downto 0);
    SIGNAL seconds_1_i_s : std_logic_vector(3 downto 0);
    SIGNAL seconds_0_i_s : std_logic_vector(3 downto 0);
    SIGNAL m0_s    		 : STD_LOGIC;     -- mode 0
    SIGNAL m1_s    		 : STD_LOGIC;     -- mode 1
    SIGNAL m2_s    		 : STD_LOGIC;     -- mode 2
    SIGNAL m3_s    		 : STD_LOGIC;     -- mode 3
    SIGNAL hour_0_o_s    : std_logic_vector(3 downto 0);
    SIGNAL hour_1_o_s    : std_logic_vector(3 downto 0);
    SIGNAL minutes_1_o_s : std_logic_vector(3 downto 0);
    SIGNAL minutes_0_o_s : std_logic_vector(3 downto 0);
    SIGNAL seconds_1_o_s : std_logic_vector(3 downto 0);
    SIGNAL seconds_0_o_s : std_logic_vector(3 downto 0);
    SIGNAL dv_s         : STD_LOGIC;
    SIGNAL m0_state_s    : STD_LOGIC;
    SIGNAL m1_state_s    : STD_LOGIC;
    SIGNAL m2_state_s    : STD_LOGIC;
    SIGNAL m3_state_s    : STD_LOGIC;


   
--
BEGIN

    uun4 : tsc_e PORT MAP (rb_s, cp_s, dr_s, sx_s, 
    hour_0_i_s, hour_1_i_s, minutes_1_i_s, minutes_0_i_s, seconds_1_i_s, seconds_0_i_s , 
    m0_s, m1_s, m2_s, m3_s, 
    hour_0_o_s, hour_1_o_s, minutes_1_o_s, minutes_0_o_s, seconds_1_o_s, seconds_0_o_s , 
    dv_s, m0_state_s, m1_state_s, m2_state_s, m3_state_s);
    --
    doTB : PROCESS
    BEGIN
        sx_s <= '0';
        dr_s <= '1';
        hour_0_i_s <= "0001";
        hour_1_i_s <= "0001";
        minutes_1_i_s <= "0001";
        minutes_0_i_s <= "0001";
        seconds_1_i_s <= "0001";
        seconds_0_i_s <= "0001";
        m0_s <= '0';
        m1_s <= '0';
        m2_s <= '0';
        m3_s <= '0';
        WAIT FOR 500 NS;
        sx_s <= '1';
        WAIT FOR 500 NS;
        sx_s <= '0';
        WAIT;
    END PROCESS doTB;

clocking : PROCESS 
begin
    cp_s <= '1';
    WAIT FOR 50 NS;
    cp_s <= '0';
    WAIT FOR 50 NS;
END PROCESS clocking;

reseting : PROCESS
begin
    rb_s <= '0';
    WAIT FOR 50 NS;
    rb_s <= '1';
    WAIT;
end process reseting;

END a1;
