
--------------------------------------------------------------------------------------------------------------
ARCHITECTURE BCD_to_ASCII_a OF BCD_to_ASCII_e IS
BEGIN
     digit3_o <= "0011" & digit3_i;
     digit2_o <= "0011" & digit2_i;
     digit1_o <= "0011" & digit1_i;
     digit0_o <= "0011" & digit0_i;
     cr_o <= "00001101";
     lf_o <= "00001010";
END BCD_to_ASCII_a;
