ARCHITECTURE arch OF mux16_txd_e IS
    SIGNAL d0_s, d1_s : STD_LOGIC;
    SIGNAL d2_s, d3_s : STD_LOGIC;
    SIGNAL d4_s, d5_s : STD_LOGIC;
    SIGNAL d6_s, d7_s : STD_LOGIC;
BEGIN
    d7_s <= ascii_digit_i(7);
    d6_s <= ascii_digit_i(6);
    d5_s <= ascii_digit_i(5);
    d4_s <= ascii_digit_i(4);
    d3_s <= ascii_digit_i(3);
    d2_s <= ascii_digit_i(2);
    d1_s <= ascii_digit_i(1);
    d0_s <= ascii_digit_i(0);
	
    WITH seld_i SELECT
        txd_o <=  '1'  WHEN "0000",
                  '0'  WHEN "0001",
                  d0_s WHEN "0010",
                  d1_s WHEN "0011",
                  d2_s WHEN "0100",
                  d3_s WHEN "0101",
                  d4_s WHEN "0110",
                  d5_s WHEN "0111",
                  d6_s WHEN "1000",
                  d7_s WHEN "1001",
                  '1'  WHEN "1010",
                  '1'  WHEN "1011", 
                  '1'  WHEN OTHERS;
END ARCH;
