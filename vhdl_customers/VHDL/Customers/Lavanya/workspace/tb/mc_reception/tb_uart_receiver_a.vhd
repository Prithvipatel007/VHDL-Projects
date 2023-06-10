LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ARCHITECTURE tb_uart_receiver_a OF tb_uart_receiver_e IS
	
	CONSTANT clk_period_c	: 	TIME := 83 ns;
	
	CONSTANT clk_per_bdrate_c	:	INTEGER := 1250;
	
	CONSTANT bit_period_c	:	time := 104 us;
	
	
    COMPONENT uart_receiver_e is
		GENERIC(
			clk_per_bdrate	:	INTEGER := 1250
		);
		PORT(
				clk_i		:	IN STD_LOGIC;						-- system clock
				rst_i		:	IN STD_LOGIC;						-- reset system
				rx_data_i	:	IN STD_LOGIC;						-- input data serially
				rx_data_o	:	OUT STD_LOGIC_VECTOR(7 DOWNTO 0);	-- output 8-bit data
				rx_dv_o		:	OUT STD_LOGIC						-- output data valid
		);
	END COMPONENT uart_receiver_e;

    SIGNAL clk_s    :   STD_LOGIC := '0';
    SIGNAL rst_s    :   STD_LOGIC := '1';
    SIGNAL rx_data_in_s : STD_LOGIC := '1';
    SIGNAL rx_data_out_s : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL rx_dv_s  :   STD_LOGIC := '0';
	
	-- Low-level byte-write
	procedure UART_WRITE_BYTE (
		i_Data_In       : in  std_logic_vector(7 downto 0);
		signal o_Serial : out std_logic) is
	begin

		-- Send Start Bit
		o_Serial <= '0';
		wait for bit_period_c;

		-- Send Data Byte
		for ii in 0 to 7 loop
		o_Serial <= i_Data_In(ii);
		wait for bit_period_c;
		end loop;  -- ii

		-- Send Stop Bit
		o_Serial <= '1';
		wait for bit_period_c;
	end UART_WRITE_BYTE;

BEGIN

        uut : uart_receiver_e GENERIC MAP (clk_per_bdrate_c) PORT MAP (clk_s, rst_s, rx_data_in_s, rx_data_out_s, rx_dv_s);
		
		clk_s <= not clk_s after clk_period_c/2;
		
        functioning : PROCESS
        BEGIN

            WAIT UNTIL rising_edge(clk_s);			
			UART_WRITE_BYTE(X"37", rx_data_in_s);
            WAIT UNTIL rising_edge(clk_s);
			
			-- check that the correct command was received
			
			IF rx_data_out_s = X"37" THEN
				report "Test Passed - Correct Byte Received" severity note;
			ELSE
				report "Test Failed - Incorrect Byte Received" severity note;
			END IF;
			
			assert false report "Test Complete" severity failure;
           
        END PROCESS functioning;



END tb_uart_receiver_a;