ARCHITECTURE c60_a OF c60_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (s0, s1,s2,s3,s4,s5,s6,s7,s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, s31, s32, s33, 
                        s34, s35, s36, s37, s38, s39, s40, s41, s42, s43, s44, s45, s46, s47, s48, s49, s50, s51, s52, s53, s54, s55, s56, s57, s58, result, s59);
    SIGNAL cstate_s : state_name := s0;
---------------------------------------------------------------------------------------------------------------------------------------------
BEGIN
----------------------------------------------------------------------------------------------------------------------------------------------
    clocked:PROCESS (cp_i,rb_i,sec_i)
    BEGIN
        IF (rb_i= '0') THEN cstate_s <= s0;
        ELSIF (cp_i'EVENT AND cp_i='1' AND cp_i'LAST_VALUE='0') THEN
            CASE cstate_s IS
                WHEN s0    => IF(sec_i = '1') THEN cstate_s <= s1; ELSE cstate_s <= s0; END IF;
                WHEN s1    => IF(sec_i = '1') THEN cstate_s <= s2; ELSE cstate_s <= s1; END IF;
                WHEN s2    => IF(sec_i = '1') THEN cstate_s <= s3; ELSE cstate_s <= s2; END IF;
                WHEN s3    => IF(sec_i = '1') THEN cstate_s <= s4; ELSE cstate_s <= s3; END IF;
                WHEN s4    => IF(sec_i = '1') THEN cstate_s <= s5; ELSE cstate_s <= s4; END IF;
                WHEN s5    => IF(sec_i = '1') THEN cstate_s <= s6; ELSE cstate_s <= s5; END IF;
                WHEN s6    => IF(sec_i = '1') THEN cstate_s <= s7; ELSE cstate_s <= s6; END IF;
                WHEN s7    => IF(sec_i = '1') THEN cstate_s <= s8; ELSE cstate_s <= s7; END IF;
                WHEN s8    => IF(sec_i = '1') THEN cstate_s <= s9; ELSE cstate_s <= s8; END IF;
                WHEN s9    => IF(sec_i = '1') THEN cstate_s <= s10; ELSE cstate_s <= s9; END IF;
                WHEN s10    => IF(sec_i = '1') THEN cstate_s <= s11; ELSE cstate_s <= s10; END IF;
                WHEN s11    => IF(sec_i = '1') THEN cstate_s <= s12; ELSE cstate_s <= s11; END IF;
                WHEN s12    => IF(sec_i = '1') THEN cstate_s <= s13; ELSE cstate_s <= s12; END IF;
                WHEN s13    => IF(sec_i = '1') THEN cstate_s <= s14; ELSE cstate_s <= s13; END IF;
                WHEN s14    => IF(sec_i = '1') THEN cstate_s <= s15; ELSE cstate_s <= s14; END IF;
                WHEN s15    => IF(sec_i = '1') THEN cstate_s <= s16; ELSE cstate_s <= s15; END IF;
                WHEN s16    => IF(sec_i = '1') THEN cstate_s <= s17; ELSE cstate_s <= s16; END IF;
                WHEN s17    => IF(sec_i = '1') THEN cstate_s <= s18; ELSE cstate_s <= s17; END IF;
                WHEN s18    => IF(sec_i = '1') THEN cstate_s <= s19; ELSE cstate_s <= s18; END IF;
                WHEN s19    => IF(sec_i = '1') THEN cstate_s <= s20; ELSE cstate_s <= s19; END IF;
                WHEN s20    => IF(sec_i = '1') THEN cstate_s <= s21; ELSE cstate_s <= s20; END IF;
                WHEN s21    => IF(sec_i = '1') THEN cstate_s <= s22; ELSE cstate_s <= s21; END IF;
                WHEN s22    => IF(sec_i = '1') THEN cstate_s <= s23; ELSE cstate_s <= s22; END IF;
                WHEN s23    => IF(sec_i = '1') THEN cstate_s <= s24; ELSE cstate_s <= s23; END IF;
                WHEN s24    => IF(sec_i = '1') THEN cstate_s <= s25; ELSE cstate_s <= s24; END IF;
                WHEN s25    => IF(sec_i = '1') THEN cstate_s <= s26; ELSE cstate_s <= s25; END IF;
                WHEN s26    => IF(sec_i = '1') THEN cstate_s <= s27; ELSE cstate_s <= s26; END IF;
                WHEN s27    => IF(sec_i = '1') THEN cstate_s <= s28; ELSE cstate_s <= s27; END IF;
                WHEN s28    => IF(sec_i = '1') THEN cstate_s <= s29; ELSE cstate_s <= s28; END IF;
                WHEN s29    => IF(sec_i = '1') THEN cstate_s <= s30; ELSE cstate_s <= s29; END IF;
                WHEN s30    => IF(sec_i = '1') THEN cstate_s <= s31; ELSE cstate_s <= s30; END IF;
                WHEN s31    => IF(sec_i = '1') THEN cstate_s <= s32; ELSE cstate_s <= s31; END IF;
                WHEN s32    => IF(sec_i = '1') THEN cstate_s <= s33; ELSE cstate_s <= s32; END IF;
                WHEN s33    => IF(sec_i = '1') THEN cstate_s <= s34; ELSE cstate_s <= s33; END IF;
                WHEN s34    => IF(sec_i = '1') THEN cstate_s <= s35; ELSE cstate_s <= s34; END IF;
                WHEN s35    => IF(sec_i = '1') THEN cstate_s <= s36; ELSE cstate_s <= s35; END IF;
                WHEN s36    => IF(sec_i = '1') THEN cstate_s <= s37; ELSE cstate_s <= s36; END IF;
                WHEN s37    => IF(sec_i = '1') THEN cstate_s <= s38; ELSE cstate_s <= s37; END IF;
                WHEN s38    => IF(sec_i = '1') THEN cstate_s <= s39; ELSE cstate_s <= s38; END IF;
                WHEN s39    => IF(sec_i = '1') THEN cstate_s <= s40; ELSE cstate_s <= s39; END IF;
                WHEN s40    => IF(sec_i = '1') THEN cstate_s <= s41; ELSE cstate_s <= s40; END IF;
                WHEN s41    => IF(sec_i = '1') THEN cstate_s <= s42; ELSE cstate_s <= s41; END IF;
                WHEN s42    => IF(sec_i = '1') THEN cstate_s <= s43; ELSE cstate_s <= s42; END IF;
                WHEN s43    => IF(sec_i = '1') THEN cstate_s <= s44; ELSE cstate_s <= s43; END IF;
                WHEN s44    => IF(sec_i = '1') THEN cstate_s <= s45; ELSE cstate_s <= s44; END IF;
                WHEN s45    => IF(sec_i = '1') THEN cstate_s <= s46; ELSE cstate_s <= s45; END IF;
                WHEN s46    => IF(sec_i = '1') THEN cstate_s <= s47; ELSE cstate_s <= s46; END IF;
                WHEN s47    => IF(sec_i = '1') THEN cstate_s <= s48; ELSE cstate_s <= s47; END IF;
                WHEN s48    => IF(sec_i = '1') THEN cstate_s <= s49; ELSE cstate_s <= s48; END IF;
                WHEN s49    => IF(sec_i = '1') THEN cstate_s <= s50; ELSE cstate_s <= s49; END IF;
                WHEN s50    => IF(sec_i = '1') THEN cstate_s <= s51; ELSE cstate_s <= s50; END IF;
                WHEN s51    => IF(sec_i = '1') THEN cstate_s <= s52; ELSE cstate_s <= s51; END IF;
                WHEN s52    => IF(sec_i = '1') THEN cstate_s <= s53; ELSE cstate_s <= s52; END IF;
                WHEN s53    => IF(sec_i = '1') THEN cstate_s <= s54; ELSE cstate_s <= s53; END IF;
                WHEN s54    => IF(sec_i = '1') THEN cstate_s <= s55; ELSE cstate_s <= s54; END IF;
                WHEN s55    => IF(sec_i = '1') THEN cstate_s <= s56; ELSE cstate_s <= s55; END IF;
                WHEN s56    => IF(sec_i = '1') THEN cstate_s <= s57; ELSE cstate_s <= s56; END IF;
                WHEN s57    => IF(sec_i = '1') THEN cstate_s <= s58; ELSE cstate_s <= s57; END IF;
                WHEN s58    => IF(sec_i = '1') THEN cstate_s <= result; ELSE cstate_s <= s58; END IF;
				WHEN result    => cstate_s <= s59;
                WHEN s59    => IF(sec_i = '1') THEN cstate_s <= s0; ELSE cstate_s <= s59; END IF;
                WHEN OTHERS	=> cstate_s <= s0;
            END CASE;	  
        END IF;
    END PROCESS clocked;
----------------------------------------------------------------------------------------------------------------------------------------------

    task : PROCESS(cstate_s)
    BEGIN 
        CASE cstate_s IS

            WHEN s0     =>  s0_o <= "0000";
							s1_o <= "0000";
							sco_o <= '0';
                                 
            WHEN s1     =>  s0_o <= "0000";
							s1_o <= "0001";
							sco_o <= '0';
			
			WHEN s2     =>  s0_o <= "0000";
							s1_o <= "0010";
							sco_o <= '0';
			
			WHEN s3     =>  s0_o <= "0000";
							s1_o <= "0011";
							sco_o <= '0';
			
			WHEN s4     =>  s0_o <= "0000";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s5     =>  s0_o <= "0000";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s6     =>  s0_o <= "0000";
							s1_o <= "0110";
							sco_o <= '0';
							
							
			WHEN s7     =>  s0_o <= "0000";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s8     =>  s0_o <= "0000";
							s1_o <= "1000";
							sco_o <= '0';
							
			WHEN s9     =>  s0_o <= "0000";
							s1_o <= "1001";
							sco_o <= '0';
							
			WHEN s10     =>  s0_o <= "0001";
							s1_o <= "0000";
							sco_o <= '0';
							
			WHEN s11     =>  s0_o <= "0001";
							s1_o <= "0001";
							sco_o <= '0';
							
			WHEN s12     =>  s0_o <= "0001";
							s1_o <= "0010";
							sco_o <= '0';
							
			WHEN s13     =>  s0_o <= "0001";
							s1_o <= "0011";
							sco_o <= '0';
							
			WHEN s14     =>  s0_o <= "0001";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s15     =>  s0_o <= "0001";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s16     =>  s0_o <= "0001";
							s1_o <= "0110";
							sco_o <= '0';
							
			WHEN s17     =>  s0_o <= "0001";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s18     =>  s0_o <= "0001";
							s1_o <= "1000";
							sco_o <= '0';
							
							
			WHEN s19     =>  s0_o <= "0001";
							s1_o <= "1001";
							sco_o <= '0';
							
			WHEN s20     =>  s0_o <= "0010";
							s1_o <= "0000";
							sco_o <= '0';
							
			WHEN s21     =>  s0_o <= "0010";
							s1_o <= "0001";
							sco_o <= '0';
							
			WHEN s22     =>  s0_o <= "0010";
							s1_o <= "0010";
							sco_o <= '0';
							
			WHEN s23     =>  s0_o <= "0010";
							s1_o <= "0011";
							sco_o <= '0';
							
			WHEN s24     =>  s0_o <= "0010";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s25     =>  s0_o <= "0010";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s26     =>  s0_o <= "0010";
							s1_o <= "0110";
							sco_o <= '0';
							
			WHEN s27     =>  s0_o <= "0010";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s28     =>  s0_o <= "0010";
							s1_o <= "1000";
							sco_o <= '0';
							
							
			WHEN s29     =>  s0_o <= "0010";
							s1_o <= "1001";
							sco_o <= '0';
							
							
			WHEN s30     =>  s0_o <= "0011";
							s1_o <= "0000";
							sco_o <= '0';
							
			WHEN s31     =>  s0_o <= "0011";
							s1_o <= "0001";
							sco_o <= '0';
							
			WHEN s32     =>  s0_o <= "0011";
							s1_o <= "0010";
							sco_o <= '0';
							
			WHEN s33     =>  s0_o <= "0011";
							s1_o <= "0011";
							sco_o <= '0';
							
			WHEN s34     =>  s0_o <= "0011";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s35     =>  s0_o <= "0011";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s36     =>  s0_o <= "0011";
							s1_o <= "0110";
							sco_o <= '0';
							
			WHEN s37     =>  s0_o <= "0011";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s38     =>  s0_o <= "0011";
							s1_o <= "1000";
							sco_o <= '0';
							
							
			WHEN s39     =>  s0_o <= "0011";
							s1_o <= "1001";
							sco_o <= '0';
							
			WHEN s40     =>  s0_o <= "0100";
							s1_o <= "0000";
							sco_o <= '0';
							
			WHEN s41     =>  s0_o <= "0100";
							s1_o <= "0001";
							sco_o <= '0';
							
			WHEN s42     =>  s0_o <= "0100";
							s1_o <= "0010";
							sco_o <= '0';
							
			WHEN s43     =>  s0_o <= "0100";
							s1_o <= "0011";
							sco_o <= '0';
							
			WHEN s44     =>  s0_o <= "0100";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s45     =>  s0_o <= "0100";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s46     =>  s0_o <= "0100";
							s1_o <= "0110";
							sco_o <= '0';
							
			WHEN s47     =>  s0_o <= "0100";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s48     =>  s0_o <= "0100";
							s1_o <= "1000";
							sco_o <= '0';
							
							
			WHEN s49     =>  s0_o <= "0100";
							s1_o <= "1001";
							sco_o <= '0';
							
							
			WHEN s50     =>  s0_o <= "0101";
							s1_o <= "0000";
							sco_o <= '0';
							
			WHEN s51     =>  s0_o <= "0101";
							s1_o <= "0001";
							sco_o <= '0';
							
			WHEN s52     =>  s0_o <= "0101";
							s1_o <= "0010";
							sco_o <= '0';
							
			WHEN s53     =>  s0_o <= "0101";
							s1_o <= "0011";
							sco_o <= '0';
							
			WHEN s54     =>  s0_o <= "0101";
							s1_o <= "0100";
							sco_o <= '0';
							
			WHEN s55     =>  s0_o <= "0101";
							s1_o <= "0101";
							sco_o <= '0';
							
			WHEN s56     =>  s0_o <= "0101";
							s1_o <= "0110";
							sco_o <= '0';
							
			WHEN s57     =>  s0_o <= "0101";
							s1_o <= "0111";
							sco_o <= '0';
							
			WHEN s58     =>  s0_o <= "0101";
							s1_o <= "1000";
							sco_o <= '0';	
			
			WHEN result  =>  s0_o <= "0101";
							s1_o <= "1001";
							sco_o <= '1';

			WHEN s59     =>  s0_o <= "0101";
							s1_o <= "1001";
							sco_o <= '0';
			
			WHEN OTHERS => s0_o <= "0000";
							s1_o <= "0000";
							sco_o <= '0';
        END CASE;
    END PROCESS task;
END c60_a;
