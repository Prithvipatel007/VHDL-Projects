architecture c10ec_a of c10ec_e is
    constant s0_c : std_logic_vector(3 downto 0) := "0000";
    constant s1_c : std_logic_vector(3 downto 0) := "0001";
    constant s2_c : std_logic_vector(3 downto 0) := "0010";
    constant s3_c : std_logic_vector(3 downto 0) := "0011";
    constant s4_c : std_logic_vector(3 downto 0) := "0100";
    constant s5_c : std_logic_vector(3 downto 0) := "0101";
    constant s6_c : std_logic_vector(3 downto 0) := "0110";
    constant s7_c : std_logic_vector(3 downto 0) := "0111";
    constant s8_c : std_logic_vector(3 downto 0) := "1000";
    constant s9_c : std_logic_vector(3 downto 0) := "1001";

    signal current_state_s : std_logic_vector(3 downto 0) := s0_c;
begin
    sm_counter : process(rst_i,clk_i)
    begin
        if(rst_i='0') then current_state_s <= s0_c;
        elsif(rising_edge(clk_i)) then
            if(cl_i = '1') then current_state_s <= s0_c;
            else
                case current_state_s is
                    when s0_c => if(en_i='1') then current_state_s <= s1_c;end if;
                    when s1_c => if(en_i='1') then current_state_s <= s2_c;end if;
                    when s2_c => if(en_i='1') then current_state_s <= s3_c;end if;
                    when s3_c => if(en_i='1') then current_state_s <= s4_c;end if;
                    when s4_c => if(en_i='1') then current_state_s <= s5_c;end if;
                    when s5_c => if(en_i='1') then current_state_s <= s6_c;end if;
                    when s6_c => if(en_i='1') then current_state_s <= s7_c;end if;
                    when s7_c => if(en_i='1') then current_state_s <= s8_c;end if;
                    when s8_c => if(en_i='1') then current_state_s <= s9_c;end if;
                    when s9_c => if(en_i='1') then current_state_s <= s0_c;end if;
                    when others => current_state_s <= s0_c;
                end case;
            end if;
        end if;
    end process sm_counter;

q3_o <= current_state_s(3);
co_o <= current_state_s(3) and not current_state_s(2) and not current_state_s(1) and current_state_s(0) and en_i;

end c10ec_a;