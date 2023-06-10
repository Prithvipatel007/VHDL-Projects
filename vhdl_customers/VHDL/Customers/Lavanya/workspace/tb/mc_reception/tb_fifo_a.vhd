LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

architecture tb_fifo_a of tb_fifo_e is
 
    CONSTANT DEPTH_c : integer := 4;
    CONSTANT WIDTH_c : integer := 8;
     
    SIGNAL rst_s   : std_logic := '1';
    SIGNAL clk_s   : std_logic := '0';
    SIGNAL wr_en_s   : std_logic := '0';
    SIGNAL wr_data_s : std_logic_vector(WIDTH_c-1 downto 0) := X"A5";
    SIGNAL full_s    : std_logic;
    SIGNAL rd_en_s   : std_logic := '0';
    SIGNAL rd_data_s : std_logic_vector(WIDTH_c-1 downto 0);
    SIGNAL empty_s   : std_logic;
     
    COMPONENT fifo_e IS
    GENERIC (
        WIDTH_g : natural := 8;
        DEPTH_g : integer := 128
        );
    PORT (
        rst_i : IN std_logic;
        clk_i : IN std_logic;
    
        -- FIFO Write Interface
        wr_en_i   : IN  std_logic;
        wr_data_i : IN  std_logic_vector(WIDTH_g-1 DOWNTO 0);
        full_o    : OUT std_logic;
    
        -- FIFO Read Interface
        rd_en_i   : IN  std_logic;
        rd_data_o : OUT std_logic_vector(WIDTH_g-1 DOWNTO 0);
        empty_o   : OUT std_logic
        );
    END COMPONENT fifo_e;
    
     
  BEGIN
   
    fifo_e_INST : fifo_e
      generic map (
        WIDTH_c,
        DEPTH_c
        )
      port map (
        rst_s,
        clk_s,
        wr_en_s,
        wr_data_s,
        full_s,
        rd_en_s,
        rd_data_s,
        empty_s
        );
   
   
    clk_s <= not clk_s after 5 ns;

    p_TEST : process
    begin
      wait until clk_s = '1';
      wr_en_s <= '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wr_en_s <= '0';
      rd_en_s <= '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      rd_en_s <= '0';
      wr_en_s <= '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      rd_en_s <= '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wr_en_s <= '0';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
      wait until clk_s = '1';
   
    end process;
     
     
  end tb_fifo_a;