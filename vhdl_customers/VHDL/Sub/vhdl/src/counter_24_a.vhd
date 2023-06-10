ARCHITECTURE counter_24_a OF counter_24_e IS
----------------------------------------------------------------------------------------------------------------------------------------------
    TYPE state_name IS (s0, s1,s2,s3,s4,s5,s6,s7,s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21, s22, result, s23);
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
                WHEN s22    => IF(sec_i = '1') THEN cstate_s <= result; ELSE cstate_s <= s22; END IF;
				WHEN result => cstate_s <= s23;
                WHEN s23    => IF(sec_i = '1') THEN cstate_s <= s0; ELSE cstate_s <= s23; END IF;
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
							
			WHEN result  =>  s0_o <= "0010";
							s1_o <= "0011";
							sco_o <= '1';
			
			WHEN s23     =>  s0_o <= "0010";
							s1_o <= "0011";
							sco_o <= '0';

			WHEN OTHERS  =>  s0_o <= "0000";
							s1_o <= "0000";
							sco_o <= '0';
        END CASE;
    END PROCESS task;
END counter_24_a;
