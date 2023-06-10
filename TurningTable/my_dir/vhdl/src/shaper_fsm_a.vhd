ARCHITECTURE arch OF shaper_fsm_e IS
    TYPE state_name IS (s0, s1, s2,s3, s4, s5, s6, s7, s8);
    SIGNAL state_s : state_name := s0;
BEGIN
    clocked : PROCESS(rb_i, cp_i,clk_1k_i)
    BEGIN
        IF(rb_i = '0') THEN state_s <= s0;
        ELSE
            IF(cp_i'EVENT AND cp_i = '1' AND cp_i'LAST_VALUE = '0') THEN
                CASE state_s IS
                    WHEN s0 => IF(s_i = '1') THEN state_s <= s1; END IF;
                    WHEN s1 => IF(s_i = '1') THEN state_s <= s2; 
					           ELSIF(secp_i = '1') THEN state_s <= s0; END IF;
                    WHEN s2 => state_s <= s3;
                    WHEN s3 => IF(clk_1k_i = '1') THEN state_s <= s4; END IF;
                    WHEN s4 => IF(clk_1k_i = '1') THEN state_s <= s5; END IF;
                    WHEN s5 => IF(clk_1k_i = '1') THEN state_s <= s6; END IF;
                    WHEN s6 => IF(clk_1k_i = '1') THEN state_s <= s7; END IF;
                    WHEN s7 => IF(clk_1k_i = '1') THEN state_s <= s8; END IF;
                    WHEN s8 => IF(clk_1k_i = '1') THEN state_s <= s0; END IF;
                    WHEN OTHERS => state_s <= s0;
                END CASE;
            END IF;
        END IF;
    END PROCESS clocked;
-------------------------------------------------------------------------------------------

    result : PROCESS (state_s)
    BEGIN
        CASE state_s IS
            WHEN s0    =>   cl_o <= '1';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN s1    =>   cl_o <= '0';
                            gate_o <= '1';
                            dv_o <= '0';
 
            WHEN s2    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '1';

            WHEN s3    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';			

            WHEN s4    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN s5    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN s6    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN s7    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN s8    =>   cl_o <= '0';
                            gate_o <= '0';
                            dv_o <= '0';

            WHEN OTHERS	=>  cl_o <= '1';
                            gate_o <= '0';
                            dv_o <= '0';
        END CASE;
    END PROCESS result;
END arch;
