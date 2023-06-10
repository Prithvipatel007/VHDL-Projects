ARCHITECTURE tb_tsc_ctrl_a OF tb_tsc_ctrl_e IS

COMPONENT tsc_ctrl_e IS
    PORT(
        --
        --  Inputs
        --
        rb_i    : IN STD_LOGIC;
        cp_i    : IN STD_LOGIC;
        dr_i    : IN STD_LOGIC;
        sx_i    : IN STD_LOGIC;     -- sensor input
        
        h_0_i    :   IN std_logic_vector(3 downto 0);
        h_1_i    :   IN std_logic_vector(3 downto 0);
        m_1_i :   IN std_logic_vector(3 downto 0);
        m_0_i :   IN std_logic_vector(3 downto 0);
        s_1_i :   IN std_logic_vector(3 downto 0);
        s_0_i :   IN std_logic_vector(3 downto 0);

        m0_i    : IN STD_LOGIC;     -- mode 0
        m1_i    : IN STD_LOGIC;     -- mode 1
        t0_i    : IN STD_LOGIC;     -- test mode 0
        t1_i    : IN STD_LOGIC;     -- test mode 1
        --
        -- Outputs
        --
        h_0_o    :   OUT std_logic_vector(3 downto 0);
        h_1_o    :   OUT std_logic_vector(3 downto 0);
        m_1_o :   OUT std_logic_vector(3 downto 0);
        m_0_o :   OUT std_logic_vector(3 downto 0);
        s_1_o :   OUT std_logic_vector(3 downto 0);
        s_0_o :   OUT std_logic_vector(3 downto 0);

        dv_o          : OUT STD_LOGIC;
        m0_state_o    : OUT STD_LOGIC;
        m1_state_o    : OUT STD_LOGIC;
        t0_state_o    : OUT STD_LOGIC;
        t1_state_o    : OUT STD_LOGIC
        );
END COMPONENT tsc_ctrl_e;

    SIGNAL rb_s    		 : STD_LOGIC;
    SIGNAL cp_s    		 : STD_LOGIC;
    SIGNAL dr_s    		 : STD_LOGIC;
    SIGNAL sx_s    		 : STD_LOGIC;     -- sensor input
    SIGNAL h_0_i_s    : std_logic_vector(3 downto 0);
    SIGNAL h_1_i_s    : std_logic_vector(3 downto 0);
    SIGNAL m_1_i_s : std_logic_vector(3 downto 0);
    SIGNAL m_0_i_s : std_logic_vector(3 downto 0);
    SIGNAL s_1_i_s : std_logic_vector(3 downto 0);
    SIGNAL s_0_i_s : std_logic_vector(3 downto 0);
    SIGNAL m0_s    		 : STD_LOGIC;     -- mode 0
    SIGNAL m1_s    		 : STD_LOGIC;     -- mode 1
    SIGNAL t0_s    		 : STD_LOGIC;     -- test mode 0
    SIGNAL t1_s    		 : STD_LOGIC;     -- test mode 1
    SIGNAL h_0_o_s    : std_logic_vector(3 downto 0);
    SIGNAL h_1_o_s    : std_logic_vector(3 downto 0);
    SIGNAL m_1_o_s : std_logic_vector(3 downto 0);
    SIGNAL m_0_o_s : std_logic_vector(3 downto 0);
    SIGNAL s_1_o_s : std_logic_vector(3 downto 0);
    SIGNAL s_0_o_s : std_logic_vector(3 downto 0);
    SIGNAL dv_s          : STD_LOGIC;
    SIGNAL m0_state_s    : STD_LOGIC;
    SIGNAL m1_state_s    : STD_LOGIC;
    SIGNAL t0_state_s    : STD_LOGIC;
    SIGNAL t1_state_s    : STD_LOGIC;

BEGIN

    uun1 : tsc_ctrl_e PORT MAP (rb_s, cp_s, dr_s, sx_s, 
        h_0_i_s, h_1_i_s, m_1_i_s, m_0_i_s, s_1_i_s, s_0_i_s , 
        m0_s, m1_s, t0_s, t1_s, 
        h_0_o_s, h_1_o_s, m_1_o_s, m_0_o_s, s_1_o_s, s_0_o_s , 
        dv_s, m0_state_s, m1_state_s, t0_state_s, t1_state_s);
    --
    doTB : PROCESS
    BEGIN
        sx_s <= '0';
        dr_s <= '1';
        h_0_i_s <= "0001";
        h_1_i_s <= "0001";
        m_1_i_s <= "0001";
        m_0_i_s <= "0001";
        s_1_i_s <= "0001";
        s_0_i_s <= "0001";
        m0_s <= '0';
        m1_s <= '0';
        t0_s <= '0';
        t1_s <= '0';
        WAIT FOR 500 NS;
        wait UNTIL rising_edge(cp_s);
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

END tb_tsc_ctrl_a;
