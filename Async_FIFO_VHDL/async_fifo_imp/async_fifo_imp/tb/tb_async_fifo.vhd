LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_async_fifo IS
	generic( 
      pol_rst    : BOOLEAN := false;      --low active reset
      data_width : NATURAL := 8;
      fifo_size  : NATURAL := 1024;
	  afull		 : INTEGER := 1020;			-- always has to be positive
	  aempty	 : INTEGER := 4;			-- always has to be positive
      depth      : NATURAL := 10           --log2 of fifo_size
   );
END tb_async_fifo;

ARCHITECTURE rtl OF tb_async_fifo IS
	
	COMPONENT async_fifo IS
		generic(
			pol_rst    : BOOLEAN := false;      --low active reset
			data_width : NATURAL := 8;
			fifo_size  : NATURAL := 8;
			afull		 : INTEGER := 6;			-- always has to be positive
			aempty	 : INTEGER := 2;			-- always has to be positive
			depth      : NATURAL := 3           --log2 of fifo_size
		);
		port(
			wclk      : in     STD_LOGIC;
			qclk	  : in 	 STD_LOGIC;
			wclk_en_n : in     STD_LOGIC;
			wclk_rst  : in     STD_LOGIC;
			rclk      : in     STD_LOGIC;
			rclk_en_n : in     STD_LOGIC;
			rclk_rst  : in     STD_LOGIC;
			din       : in     STD_LOGIC_VECTOR (data_width-1 downto 0);
			rd        : in     STD_LOGIC;
			wr        : in     STD_LOGIC;
			dout      : out    STD_LOGIC_VECTOR (data_width-1 downto 0);
			rhf       : out    STD_LOGIC;
			ef        : out    STD_LOGIC;
			aef		  : out	   STD_LOGIC;
			ff        : out    STD_LOGIC;
			aff		  : out    STD_LOGIC;
			rlevel    : out    STD_LOGIC_VECTOR (depth downto 0);
			wlevel    : out    STD_LOGIC_VECTOR (depth downto 0);
			whf       : out    STD_LOGIC;
			SB_CORRECT: out 	 STD_LOGIC;
			DB_DETECT : out 	 STD_LOGIC
		);
	-- declarations	

	END COMPONENT async_fifo;
	
	SIGNAL tb_wclk			:	STD_LOGIC;
	SIGNAL tb_wclk_en_n		:	STD_LOGIC;
	SIGNAL tb_wclk_rst		:	STD_LOGIC;
	SIGNAL tb_rclk			:	STD_LOGIC;
	SIGNAL tb_rclk_en_n		:	STD_LOGIC;
	SIGNAL tb_rclk_rst		: 	STD_LOGIC;
	SIGNAL tb_din			:	STD_LOGIC_VECTOR(data_width-1 DOWNTO 0);
	SIGNAL tb_rd			:	STD_LOGIC;
	SIGNAL tb_wr			:	STD_LOGIC;
	SIGNAL tb_dout			:	STD_LOGIC_VECTOR(data_width-1 DOWNTO 0);
	SIGNAL tb_rhf			:	STD_LOGIC;
	SIGNAL tb_ef			:	STD_LOGIC;
	SIGNAL tb_aef			:	STD_LOGIC;
	SIGNAL tb_aff			:	STD_LOGIC;
	SIGNAL tb_ff			:	STD_LOGIC;
	SIGNAL tb_rlevel		:	STD_LOGIC_VECTOR(depth DOWNTO 0);
	SIGNAL tb_wlevel		:	STD_LOGIC_VECTOR(depth DOWNTO 0);
	SIGNAL tb_whf			:	STD_LOGIC;
	SIGNAL tb_SB_CORRECT		:	STD_LOGIC;
	SIGNAL tb_DB_DETECT 		:	STD_LOGIC;
	SIGNAL tb_qclk		:	STD_LOGIC;
	
	
BEGIN
	
	uut1 : async_fifo 
	GENERIC MAP(
		pol_rst => pol_rst,
		data_width => data_width,
		fifo_size => fifo_size,
		afull	=>	afull,
		aempty	=>	aempty,
		depth => depth
	)
	PORT MAP(
		wclk		=> 	tb_wclk,
		qclk		=>	tb_qclk,
		wclk_en_n	=> 	tb_wclk_en_n, 
		wclk_rst	=>	tb_wclk_rst,
		rclk		=>	tb_rclk,
		rclk_en_n	=> 	tb_rclk_en_n,
		rclk_rst	=> 	tb_rclk_rst,
		din			=>	tb_din,
		rd			=>	tb_rd,
		wr			=>	tb_wr,
		dout		=> 	tb_dout,
		rhf			=> 	tb_rhf,
		ef			=>	tb_ef,
		aef			=>	tb_aef,
		ff			=> 	tb_ff,
		aff			=>	tb_aff,
		rlevel		=> 	tb_rlevel,
		wlevel		=> 	tb_wlevel,
		whf			=>	tb_whf,
		SB_CORRECT 	=>	tb_SB_CORRECT,
		DB_DETECT	=>	tb_DB_DETECT
	);
	
	write_clock_proc : PROCESS
	BEGIN
		tb_wclk <= '1';
		WAIT FOR 20000 ps;
		tb_wclk <= '0';
		WAIT FOR 20000 ps;
	END PROCESS write_clock_proc;
	
	write_clock_proc_1 : PROCESS
	BEGIN
		tb_qclk <= '1';
		WAIT FOR 5000 ps;
		tb_qclk <= '0';
		WAIT FOR 5000 ps;
	END PROCESS write_clock_proc_1;
	
	read_clock_proc : PROCESS 
	BEGIN
		tb_rclk <= '1';
		WAIT FOR 10000 ps;
		tb_rclk <= '0';
		WAIT FOR 10000 ps;
	END PROCESS read_clock_proc;
	
	uut_process : PROCESS
	BEGIN
		tb_rclk_rst <= '0';
		tb_wclk_rst <= '0';
		tb_rclk_en_n <= '1';
		tb_rd <= '0'; 
		tb_wclk_en_n <= '0';
		tb_wr <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rclk_rst <= '1';
		tb_wclk_rst <= '1';
		-- writing fifo starts

		WAIT UNTIL rising_edge(tb_wclk);
		tb_din <= "00000011";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "00000111";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "00011001";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000010";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000011";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000100";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000101";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000110";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wclk_en_n <= '1';	WAIT UNTIL rising_edge(tb_wclk);
		
		tb_rclk_en_n <= '0';
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
--		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
--		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
--		WAIT UNTIL rising_edge(tb_rclk);
--		WAIT UNTIL rising_edge(tb_rclk);
--		WAIT UNTIL rising_edge(tb_rclk);
		tb_rclk_en_n <= '1';
		--
		tb_wclk_en_n <= '0';
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_din <= "00000011";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "00000111";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "00011001";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000010";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000011";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000100";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000101";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		
		tb_din <= "11000110";	WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '1';			WAIT UNTIL rising_edge(tb_wclk);
		tb_wr <= '0';			WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_wclk_en_n <= '1';	WAIT UNTIL rising_edge(tb_wclk);
		
		tb_rclk_en_n <= '0';	WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rd <= '1';			WAIT UNTIL rising_edge(tb_rclk);
		tb_rd <= '0';			WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_wclk);
		WAIT UNTIL rising_edge(tb_wclk);
		tb_rclk_en_n <= '1';
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT UNTIL rising_edge(tb_rclk);
		WAIT;
	END PROCESS uut_process;
	
END rtl;