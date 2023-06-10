architecture transmission_a of transmission_e is
----------------------------------------------------------------------------------------------------------------------------------------------
    type state_t is (idle_st,start_st, bit_7_st, bit_6_st, bit_5_st, bit_4_st , bit_3_st, bit_2_st, bit_1_st, bit_0_st, stop_st);
    signal current_state_s : state_t := idle_st;
    signal reg_s : std_logic_vector(7 downto 0);
---------------------------------------------------------------------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------------------------------------------------------------------
    transmission_p:process (clk_i,rst_i)
    begin
        if (rst_i= '0') then current_state_s <= idle_st;
        elsif (rising_edge(clk_i)) then
            case current_state_s is
                when idle_st    => if(dv_i = '1') then current_state_s <= start_st; reg_s <= ascii_i; ELSE current_state_s <= idle_st; reg_s <= (OTHERS => '0'); end if;  
                when start_st	=> if(bdr_i = '1') then current_state_s <= bit_7_st; end if; 
                when bit_7_st		=> if(bdr_i = '1') then current_state_s <= bit_6_st; end if;
                when bit_6_st		=> if(bdr_i = '1') then current_state_s <= bit_5_st; end if;
                when bit_5_st		=> if(bdr_i = '1') then current_state_s <= bit_4_st; end if;
                when bit_4_st		=> if(bdr_i = '1') then current_state_s <= bit_3_st; end if;
                when bit_3_st		=> if(bdr_i = '1') then current_state_s <= bit_2_st; end if;
                when bit_2_st		=> if(bdr_i = '1') then current_state_s <= bit_1_st; end if;
                when bit_1_st		=> if(bdr_i = '1') then current_state_s <= bit_0_st; end if;
                when bit_0_st		=> if(bdr_i = '1') then current_state_s <= stop_st; end if;
                when stop_st		=> if(bdr_i = '1') then current_state_s <= idle_st; end if;
				                   
            end case;	  
        end if;
    end process transmission_p;
----------------------------------------------------------------------------------------------------------------------------------------------

    transition_p : process(current_state_s, reg_s, ascii_i)
    begin 
        case current_state_s is
            when idle_st    =>  serial_o <= '1';
            when start_st   =>  serial_o <= '0';
            when bit_7_st 	    =>  serial_o <= reg_s(7); 
            when bit_6_st	    =>  serial_o <= reg_s(6);
            when bit_5_st	    =>  serial_o <= reg_s(5);
            when bit_4_st    	=>  serial_o <= reg_s(4);
            when bit_3_st 	    =>  serial_o <= reg_s(3);
            when bit_2_st	    =>  serial_o <= reg_s(2);
            when bit_1_st	    =>  serial_o <= reg_s(1);
            when bit_0_st	    =>  serial_o <= reg_s(0);
            when stop_st	    =>  serial_o <= '1';
            when others	    =>  serial_o <= '1';
        end case;
    end process transition_p;
end transmission_a;
