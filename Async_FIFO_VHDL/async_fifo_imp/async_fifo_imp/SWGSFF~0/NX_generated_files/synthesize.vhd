-- NanoXplore Simulation File
--
-- Date    : 08/07/2019
--

library ieee;
use ieee.std_logic_1164.all;

library NX;
use NX.nxPackage.all;

entity async_fifo is
port (
  aef                 : out   std_logic;
  aff                 : out   std_logic;
  din                 : in    std_logic_vector(15 downto 0);
  dout                : out   std_logic_vector(15 downto 0);
  ef                  : out   std_logic;
  ff                  : out   std_logic;
  rclk                : in    std_logic;
  rclk_en_n           : in    std_logic;
  rclk_rst            : in    std_logic;
  rd                  : in    std_logic;
  rhf                 : out   std_logic;
  rlevel              : out   std_logic_vector(10 downto 0);
  wclk                : in    std_logic;
  wclk_en_n           : in    std_logic;
  wclk_rst            : in    std_logic;
  whf                 : out   std_logic;
  wlevel              : out   std_logic_vector(10 downto 0);
  wr                  : in    std_logic
);
end async_fifo;

architecture Synthesized of async_fifo is
  signal LOGIC_n224          : std_logic;
  signal LOGIC_n225          : std_logic;
  signal LOGIC_n226          : std_logic;
  signal LOGIC_n228          : std_logic;
  signal LOGIC_n231          : std_logic;
  signal LOGIC_n232          : std_logic;
  signal LOGIC_n234          : std_logic;
  signal LOGIC_n235          : std_logic;
  signal LOGIC_n236          : std_logic;
  signal LOGIC_n237          : std_logic;
  signal LOGIC_n238          : std_logic;
  signal LOGIC_n239          : std_logic;
  signal LOGIC_n240          : std_logic;
  signal LOGIC_n241          : std_logic;
  signal LOGIC_n242          : std_logic;
  signal LOGIC_n264          : std_logic;
  signal LOGIC_n265          : std_logic;
  signal LOGIC_n266          : std_logic;
  signal LOGIC_n268          : std_logic;
  signal LOGIC_n269          : std_logic;
  signal LOGIC_n270          : std_logic;
  signal LOGIC_n271          : std_logic;
  signal LOGIC_n272          : std_logic;
  signal LOGIC_n273          : std_logic;
  signal LOGIC_n274          : std_logic;
  signal LOGIC_n275          : std_logic;
  signal LOGIC_n276          : std_logic;
  signal LOGIC_n277          : std_logic;
  signal LOGIC_n278          : std_logic;
  signal LOGIC_n279          : std_logic;
  signal LOGIC_n291_1        : std_logic;
  signal LOGIC_n294_1        : std_logic;
  signal LOGIC_n321          : std_logic;
  signal LOGIC_n322          : std_logic;
  signal LOGIC_n323          : std_logic;
  signal LessThan_L288_carry_1: std_logic;
  signal LessThan_L288_carry_2: std_logic;
  signal LessThan_aef_carry_1: std_logic;
  signal LessThan_aef_carry_2: std_logic;
  signal LessThan_aff_n15    : std_logic;
  signal LessThan_aff_n16    : std_logic;
  signal le_67_inv           : std_logic;
  signal add_L73_1_carry_1   : std_logic;
  signal add_L73_1_carry_2   : std_logic;
  signal add_L73_carry_1     : std_logic;
  signal add_L73_carry_2     : std_logic;
  signal add_temp_rlevel_carry_1: std_logic;
  signal add_temp_rlevel_carry_2: std_logic;
  signal add_temp_wlevel_carry_1: std_logic;
  signal add_temp_wlevel_carry_2: std_logic;
  signal ef_sig              : std_logic;
  signal ff_sig              : std_logic;
  signal global_0            : std_logic;
  signal global_1            : std_logic;
  signal n23                 : std_logic;
  signal n24                 : std_logic;
  signal n25                 : std_logic;
  signal n26                 : std_logic;
  signal n27                 : std_logic;
  signal n28                 : std_logic;
  signal n29                 : std_logic;
  signal n30                 : std_logic;
  signal n31                 : std_logic;
  signal n32                 : std_logic;
  signal n33                 : std_logic;
  signal n38                 : std_logic;
  signal n40                 : std_logic;
  signal n41                 : std_logic;
  signal n42                 : std_logic;
  signal n43                 : std_logic;
  signal n92                 : std_logic;
  signal n93                 : std_logic;
  signal n94                 : std_logic;
  signal n95                 : std_logic;
  signal n96                 : std_logic;
  signal n97                 : std_logic;
  signal n98                 : std_logic;
  signal n99                 : std_logic;
  signal n100                : std_logic;
  signal n101                : std_logic;
  signal n102                : std_logic;
  signal n419                : std_logic;
  signal n430                : std_logic;
  signal out_lut_fcp_147     : std_logic;
  signal out_lut_fcp_186     : std_logic;
  signal out_lut_fcp_187     : std_logic;
  signal out_lut_fcp_188     : std_logic;
  signal out_lut_fcp_189     : std_logic;
  signal out_lut_fcp_190     : std_logic;
  signal out_lut_fcp_191     : std_logic;
  signal out_lut_fcp_301     : std_logic;
  signal out_lut_fcp_302     : std_logic;
  signal out_lut_fcp_303     : std_logic;
  signal out_lut_fcp_304     : std_logic;
  signal out_lut_fcp_306     : std_logic;
  signal out_lut_fcp_307     : std_logic;
  signal out_lut_fcp_308     : std_logic;
  signal out_lut_fcp_309     : std_logic;
  signal out_ef_sig_reg      : std_logic;
  signal rd_pointer_0_le_1   : std_logic;
  signal rg_rclk             : std_logic;
  signal rg_rclk_en_n_inv    : std_logic;
  signal rg_rclk_rst_inv     : std_logic;
  signal rg_wclk             : std_logic;
  signal rg_wclk_en_n_inv    : std_logic;
  signal rg_wclk_rst_inv     : std_logic;
  signal ri_rclk             : std_logic;
  signal ri_rclk_en_n        : std_logic;
  signal ri_rclk_rst         : std_logic;
  signal ri_rd               : std_logic;
  signal ri_wclk             : std_logic;
  signal ri_wclk_en_n        : std_logic;
  signal ri_wclk_rst         : std_logic;
  signal ri_wr               : std_logic;
  signal ro_aef              : std_logic;
  signal ro_aff              : std_logic;
  signal ro_ef               : std_logic;
  signal ro_ff               : std_logic;
  signal ro_rhf              : std_logic;
  signal ro_whf              : std_logic;
  signal rt_aef              : std_logic;
  signal rt_aff              : std_logic;
  signal rt_ef               : std_logic;
  signal rt_ff               : std_logic;
  signal rt_rclk             : std_logic;
  signal rt_rclk_en_n        : std_logic;
  signal rt_rclk_rst         : std_logic;
  signal rt_rd               : std_logic;
  signal rt_rhf              : std_logic;
  signal rt_wclk             : std_logic;
  signal rt_wclk_en_n        : std_logic;
  signal rt_wclk_rst         : std_logic;
  signal rt_whf              : std_logic;
  signal rt_wr               : std_logic;
  signal r_aef               : std_logic;
  signal r_aff               : std_logic;
  signal r_rclk_en_n         : std_logic;
  signal r_rd                : std_logic;
  signal r_rhf               : std_logic;
  signal r_wclk_en_n         : std_logic;
  signal r_whf               : std_logic;
  signal r_wr                : std_logic;
  signal wr_pointer_0_le_12  : std_logic;
  signal r_din               : std_logic_vector(15 downto 0);
  signal r_dout              : std_logic_vector(15 downto 0);
  signal rd_addr             : std_logic_vector(9 downto 0);
  signal rd_pointer          : std_logic_vector(10 downto 0);
  signal rd_pointer_bin      : std_logic_vector(9 downto 0);
  signal rd_pointer_d        : std_logic_vector(10 downto 0);
  signal rd_pointer_dd       : std_logic_vector(10 downto 0);
  signal rd_pointer_dd_bin   : std_logic_vector(9 downto 0);
  signal ri_din              : std_logic_vector(15 downto 0);
  signal rlevel_i            : std_logic_vector(10 downto 0);
  signal ro_dout             : std_logic_vector(15 downto 0);
  signal ro_rlevel           : std_logic_vector(10 downto 0);
  signal ro_wlevel           : std_logic_vector(10 downto 0);
  signal rt_din              : std_logic_vector(15 downto 0);
  signal rt_dout             : std_logic_vector(15 downto 0);
  signal rt_rlevel           : std_logic_vector(10 downto 0);
  signal rt_wlevel           : std_logic_vector(10 downto 0);
  signal wlevel_i            : std_logic_vector(10 downto 0);
  signal wlevel_sig          : std_logic_vector(10 downto 10);
  signal wr_pointer          : std_logic_vector(10 downto 0);
  signal wr_pointer_bin      : std_logic_vector(9 downto 0);
  signal wr_pointer_d        : std_logic_vector(10 downto 0);
  signal wr_pointer_dd       : std_logic_vector(10 downto 0);
  signal wr_pointer_dd_bin   : std_logic_vector(9 downto 0);
  signal NX_DUMP             : std_logic := '0';

begin

  global_0 <= '0';
  global_1 <= '1';

  i_LessThan_L288_stage1 : NX_CY
    generic map (
        add_carry => 0
      , add_table1 => b"0011110011000011"
      , add_table2 => b"1100001111000011"
      , add_table3 => b"1111000011001100"
      , add_table4 => b"0011110011000011"
    )
    port map (
        A1   => rd_pointer_dd_bin(0)
      , A2   => rd_pointer_dd_bin(1)
      , A3   => rd_pointer_dd_bin(2)
      , A4   => rd_pointer_dd_bin(3)
      , B1I1 => OPEN
      , B1I2 => wr_pointer_bin(2)
      , B1I3 => wr_pointer(0)
      , B1I4 => wr_pointer(1)
      , B2I1 => OPEN
      , B2I2 => wr_pointer_bin(2)
      , B2I3 => wr_pointer(1)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => out_lut_fcp_304
      , B3I3 => out_lut_fcp_302
      , B3I4 => wr_pointer_bin(8)
      , B4I1 => OPEN
      , B4I2 => wr_pointer_bin(5)
      , B4I3 => wr_pointer(3)
      , B4I4 => wr_pointer(4)
      , CIB  => OPEN
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => LessThan_L288_carry_1
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => OPEN
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LessThan_L288_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"1100001111000011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0011001100110011"
      , add_table4 => b"0011001100110011"
    )
    port map (
        A1   => rd_pointer_dd_bin(4)
      , A2   => rd_pointer_dd_bin(5)
      , A3   => rd_pointer_dd_bin(6)
      , A4   => rd_pointer_dd_bin(7)
      , B1I1 => OPEN
      , B1I2 => wr_pointer_bin(5)
      , B1I3 => wr_pointer(4)
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => wr_pointer_bin(5)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => wr_pointer_bin(6)
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => wr_pointer_bin(7)
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => LessThan_L288_carry_1
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => LessThan_L288_carry_2
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => OPEN
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LessThan_L288_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"0011110011000011"
      , add_table2 => b"1100001111000011"
      , add_table3 => b"1111111111111111"
      , add_table4 => b"0000000000000000"
    )
    port map (
        A1   => rd_pointer_dd_bin(8)
      , A2   => rd_pointer_dd_bin(9)
      , A3   => global_0
      , A4   => OPEN
      , B1I1 => OPEN
      , B1I2 => wr_pointer(8)
      , B1I3 => wr_pointer(9)
      , B1I4 => wr_pointer(10)
      , B2I1 => OPEN
      , B2I2 => wr_pointer(9)
      , B2I3 => wr_pointer(10)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => LessThan_L288_carry_2
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => n419
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LessThan_aef_stage1 : NX_CY
    generic map (
        add_carry => 0
      , add_table1 => b"1111111111111111"
      , add_table2 => b"1111111111111111"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"1111111111111111"
    )
    port map (
        A1   => rlevel_i(0)
      , A2   => rlevel_i(1)
      , A3   => rlevel_i(2)
      , A4   => rlevel_i(3)
      , B1I1 => OPEN
      , B1I2 => OPEN
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => OPEN
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => OPEN
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => LessThan_aef_carry_1
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => OPEN
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LessThan_aef_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"1111111111111111"
      , add_table2 => b"1111111111111111"
      , add_table3 => b"1111111111111111"
      , add_table4 => b"1111111111111111"
    )
    port map (
        A1   => rlevel_i(4)
      , A2   => rlevel_i(5)
      , A3   => rlevel_i(6)
      , A4   => rlevel_i(7)
      , B1I1 => OPEN
      , B1I2 => OPEN
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => OPEN
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => LessThan_aef_carry_1
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => LessThan_aef_carry_2
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => OPEN
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LessThan_aef_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"1111111111111111"
      , add_table2 => b"1111111111111111"
      , add_table3 => b"1111111111111111"
      , add_table4 => b"1111111111111111"
    )
    port map (
        A1   => rlevel_i(8)
      , A2   => rlevel_i(9)
      , A3   => rlevel_i(10)
      , A4   => global_0
      , B1I1 => OPEN
      , B1I2 => OPEN
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => OPEN
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => LessThan_aef_carry_2
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => OPEN
      , O2   => OPEN
      , O3   => OPEN
      , O4   => r_aef
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_1_stage1 : NX_CY
    generic map (
        add_carry => 0
      , add_table1 => b"1100001100111100"
      , add_table2 => b"0011110000111100"
      , add_table3 => b"0000111100110011"
      , add_table4 => b"1100001100111100"
    )
    port map (
        A1   => global_1
      , A2   => global_0
      , A3   => global_0
      , A4   => global_0
      , B1I1 => OPEN
      , B1I2 => rd_pointer_bin(2)
      , B1I3 => rd_pointer(0)
      , B1I4 => rd_pointer(1)
      , B2I1 => OPEN
      , B2I2 => rd_pointer_bin(2)
      , B2I3 => rd_pointer(1)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => out_lut_fcp_309
      , B3I3 => out_lut_fcp_307
      , B3I4 => rd_pointer_bin(7)
      , B4I1 => OPEN
      , B4I2 => rd_pointer_bin(5)
      , B4I3 => rd_pointer(3)
      , B4I4 => rd_pointer(4)
      , CIB  => OPEN
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => add_L73_1_carry_1
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n102
      , O2   => n101
      , O3   => n100
      , O4   => n99
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_1_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"0000000000000000"
      , add_table2 => b"1100001100111100"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"0000000000000000"
    )
    port map (
        A1   => rd_pointer_bin(4)
      , A2   => global_0
      , A3   => rd_pointer_bin(6)
      , A4   => rd_pointer_bin(7)
      , B1I1 => OPEN
      , B1I2 => OPEN
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_bin(7)
      , B2I3 => rd_pointer(5)
      , B2I4 => rd_pointer(6)
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_L73_1_carry_1
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => add_L73_1_carry_2
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n98
      , O2   => n97
      , O3   => n96
      , O4   => n95
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_1_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"1100001100111100"
      , add_table2 => b"0011110000111100"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"0000000000000000"
    )
    port map (
        A1   => global_0
      , A2   => global_0
      , A3   => rd_pointer(10)
      , A4   => OPEN
      , B1I1 => OPEN
      , B1I2 => rd_pointer(8)
      , B1I3 => rd_pointer(9)
      , B1I4 => rd_pointer(10)
      , B2I1 => OPEN
      , B2I2 => rd_pointer(9)
      , B2I3 => rd_pointer(10)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_L73_1_carry_2
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n94
      , O2   => n93
      , O3   => n92
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_stage1 : NX_CY
    generic map (
        add_carry => 0
      , add_table1 => b"1100001100111100"
      , add_table2 => b"0011110000111100"
      , add_table3 => b"0000111100110011"
      , add_table4 => b"1100001100111100"
    )
    port map (
        A1   => global_1
      , A2   => global_0
      , A3   => global_0
      , A4   => global_0
      , B1I1 => OPEN
      , B1I2 => wr_pointer_bin(2)
      , B1I3 => wr_pointer(0)
      , B1I4 => wr_pointer(1)
      , B2I1 => OPEN
      , B2I2 => wr_pointer_bin(2)
      , B2I3 => wr_pointer(1)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => out_lut_fcp_304
      , B3I3 => out_lut_fcp_302
      , B3I4 => wr_pointer_bin(8)
      , B4I1 => OPEN
      , B4I2 => wr_pointer_bin(5)
      , B4I3 => wr_pointer(3)
      , B4I4 => wr_pointer(4)
      , CIB  => OPEN
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => add_L73_carry_1
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n33
      , O2   => n32
      , O3   => n31
      , O4   => n30
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"0011110000111100"
      , add_table2 => b"0000000000000000"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"0000000000000000"
    )
    port map (
        A1   => global_0
      , A2   => wr_pointer_bin(5)
      , A3   => wr_pointer_bin(6)
      , A4   => wr_pointer_bin(7)
      , B1I1 => OPEN
      , B1I2 => wr_pointer_bin(5)
      , B1I3 => wr_pointer(4)
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => OPEN
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_L73_carry_1
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => add_L73_carry_2
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n29
      , O2   => n28
      , O3   => n27
      , O4   => n26
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_L73_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_table1 => b"1100001100111100"
      , add_table2 => b"0011110000111100"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"0000000000000000"
    )
    port map (
        A1   => global_0
      , A2   => global_0
      , A3   => wr_pointer(10)
      , A4   => OPEN
      , B1I1 => OPEN
      , B1I2 => wr_pointer(8)
      , B1I3 => wr_pointer(9)
      , B1I4 => wr_pointer(10)
      , B2I1 => OPEN
      , B2I2 => wr_pointer(9)
      , B2I3 => wr_pointer(10)
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_L73_carry_2
      , CK1  => OPEN
      , CK2  => OPEN
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => OPEN
      , L2   => OPEN
      , L3   => OPEN
      , L4   => OPEN
      , O1   => n25
      , O2   => n24
      , O3   => n23
      , O4   => OPEN
      , R1   => OPEN
      , R2   => OPEN
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_temp_rlevel_stage1 : NX_CY
    generic map (
        add_carry => 1
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '1'
      , add_dff4 => '1'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0011001100110011"
      , add_table4 => b"0011001100110011"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_dd_bin(0)
      , A2   => wr_pointer_dd_bin(1)
      , A3   => wr_pointer_dd_bin(2)
      , A4   => wr_pointer_dd_bin(3)
      , B1I1 => OPEN
      , B1I2 => rd_pointer_bin(0)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_bin(1)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => rd_pointer_bin(2)
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => rd_pointer_bin(3)
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => OPEN
      , CK1  => rg_rclk
      , CK2  => rg_rclk
      , CK3  => rg_rclk
      , CK4  => rg_rclk
      , COB  => add_temp_rlevel_carry_1
      , L1   => rg_rclk_en_n_inv
      , L2   => rg_rclk_en_n_inv
      , L3   => rg_rclk_en_n_inv
      , L4   => rg_rclk_en_n_inv
      , O1   => rlevel_i(0)
      , O2   => rlevel_i(1)
      , O3   => rlevel_i(2)
      , O4   => rlevel_i(3)
      , R1   => rg_rclk_rst_inv
      , R2   => rg_rclk_rst_inv
      , R3   => rg_rclk_rst_inv
      , R4   => rg_rclk_rst_inv
    );

  i_add_temp_rlevel_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '1'
      , add_dff4 => '1'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0011001100110011"
      , add_table4 => b"0011001100110011"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_dd_bin(4)
      , A2   => wr_pointer_dd_bin(5)
      , A3   => wr_pointer_dd_bin(6)
      , A4   => wr_pointer_dd_bin(7)
      , B1I1 => OPEN
      , B1I2 => rd_pointer_bin(4)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_bin(5)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => rd_pointer_bin(6)
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => rd_pointer_bin(7)
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_temp_rlevel_carry_1
      , CK1  => rg_rclk
      , CK2  => rg_rclk
      , CK3  => rg_rclk
      , CK4  => rg_rclk
      , COB  => add_temp_rlevel_carry_2
      , L1   => rg_rclk_en_n_inv
      , L2   => rg_rclk_en_n_inv
      , L3   => rg_rclk_en_n_inv
      , L4   => rg_rclk_en_n_inv
      , O1   => rlevel_i(4)
      , O2   => rlevel_i(5)
      , O3   => rlevel_i(6)
      , O4   => rlevel_i(7)
      , R1   => rg_rclk_rst_inv
      , R2   => rg_rclk_rst_inv
      , R3   => rg_rclk_rst_inv
      , R4   => rg_rclk_rst_inv
    );

  i_add_temp_rlevel_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '0'
      , add_dff4 => '0'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0000000000000000"
      , add_table4 => b"0000000000000000"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_dd_bin(8)
      , A2   => wr_pointer_dd_bin(9)
      , A3   => OPEN
      , A4   => OPEN
      , B1I1 => OPEN
      , B1I2 => rd_pointer_bin(8)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_bin(9)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_temp_rlevel_carry_2
      , CK1  => rg_rclk
      , CK2  => rg_rclk
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => rg_rclk_en_n_inv
      , L2   => rg_rclk_en_n_inv
      , L3   => OPEN
      , L4   => OPEN
      , O1   => rlevel_i(8)
      , O2   => rlevel_i(9)
      , O3   => OPEN
      , O4   => OPEN
      , R1   => rg_rclk_rst_inv
      , R2   => rg_rclk_rst_inv
      , R3   => OPEN
      , R4   => OPEN
    );

  i_add_temp_wlevel_stage1 : NX_CY
    generic map (
        add_carry => 1
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '1'
      , add_dff4 => '1'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0011001100110011"
      , add_table4 => b"0011001100110011"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_bin(0)
      , A2   => wr_pointer_bin(1)
      , A3   => wr_pointer_bin(2)
      , A4   => wr_pointer_bin(3)
      , B1I1 => OPEN
      , B1I2 => rd_pointer_dd_bin(0)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_dd_bin(1)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => rd_pointer_dd_bin(2)
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => rd_pointer_dd_bin(3)
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => OPEN
      , CK1  => rg_wclk
      , CK2  => rg_wclk
      , CK3  => rg_wclk
      , CK4  => rg_wclk
      , COB  => add_temp_wlevel_carry_1
      , L1   => rg_wclk_en_n_inv
      , L2   => rg_wclk_en_n_inv
      , L3   => rg_wclk_en_n_inv
      , L4   => rg_wclk_en_n_inv
      , O1   => wlevel_i(0)
      , O2   => wlevel_i(1)
      , O3   => wlevel_i(2)
      , O4   => wlevel_i(3)
      , R1   => rg_wclk_rst_inv
      , R2   => rg_wclk_rst_inv
      , R3   => rg_wclk_rst_inv
      , R4   => rg_wclk_rst_inv
    );

  i_add_temp_wlevel_stage2 : NX_CY
    generic map (
        add_carry => 2
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '1'
      , add_dff4 => '1'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"0011001100110011"
      , add_table4 => b"0011001100110011"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_bin(4)
      , A2   => wr_pointer_bin(5)
      , A3   => wr_pointer_bin(6)
      , A4   => wr_pointer_bin(7)
      , B1I1 => OPEN
      , B1I2 => rd_pointer_dd_bin(4)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_dd_bin(5)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => rd_pointer_dd_bin(6)
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => rd_pointer_dd_bin(7)
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_temp_wlevel_carry_1
      , CK1  => rg_wclk
      , CK2  => rg_wclk
      , CK3  => rg_wclk
      , CK4  => rg_wclk
      , COB  => add_temp_wlevel_carry_2
      , L1   => rg_wclk_en_n_inv
      , L2   => rg_wclk_en_n_inv
      , L3   => rg_wclk_en_n_inv
      , L4   => rg_wclk_en_n_inv
      , O1   => wlevel_i(4)
      , O2   => wlevel_i(5)
      , O3   => wlevel_i(6)
      , O4   => wlevel_i(7)
      , R1   => rg_wclk_rst_inv
      , R2   => rg_wclk_rst_inv
      , R3   => rg_wclk_rst_inv
      , R4   => rg_wclk_rst_inv
    );

  i_add_temp_wlevel_stage3 : NX_CY
    generic map (
        add_carry => 2
      , add_dff1 => '1'
      , add_dff2 => '1'
      , add_dff3 => '0'
      , add_dff4 => '0'
      , add_table1 => b"0011001100110011"
      , add_table2 => b"0011001100110011"
      , add_table3 => b"1111111111111111"
      , add_table4 => b"0000000000000000"
      , dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_sync => '0'
    )
    port map (
        A1   => wr_pointer_bin(8)
      , A2   => wr_pointer_bin(9)
      , A3   => global_1
      , A4   => OPEN
      , B1I1 => OPEN
      , B1I2 => rd_pointer_dd_bin(8)
      , B1I3 => OPEN
      , B1I4 => OPEN
      , B2I1 => OPEN
      , B2I2 => rd_pointer_dd_bin(9)
      , B2I3 => OPEN
      , B2I4 => OPEN
      , B3I1 => OPEN
      , B3I2 => OPEN
      , B3I3 => OPEN
      , B3I4 => OPEN
      , B4I1 => OPEN
      , B4I2 => OPEN
      , B4I3 => OPEN
      , B4I4 => OPEN
      , CIB  => add_temp_wlevel_carry_2
      , CK1  => rg_wclk
      , CK2  => rg_wclk
      , CK3  => OPEN
      , CK4  => OPEN
      , COB  => OPEN
      , L1   => rg_wclk_en_n_inv
      , L2   => rg_wclk_en_n_inv
      , L3   => OPEN
      , L4   => OPEN
      , O1   => wlevel_i(8)
      , O2   => wlevel_i(9)
      , O3   => n430
      , O4   => OPEN
      , R1   => rg_wclk_rst_inv
      , R2   => rg_wclk_rst_inv
      , R3   => OPEN
      , R4   => OPEN
    );

  i_LOGIC_lut_4 : NX_FE
    generic map (
        lut_table => b"1011111011010111"
    )
    port map (
        CK   => OPEN
      , I1   => n97
      , I2   => n98
      , I3   => wr_pointer_dd(4)
      , I4   => wr_pointer_dd(5)
      , L    => OPEN
      , O    => LOGIC_n224
      , R    => OPEN
    );

  i_LOGIC_lut_5 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n95
      , I2   => wr_pointer_dd(6)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n225
      , R    => OPEN
    );

  i_LOGIC_lut_6 : NX_FE
    generic map (
        lut_table => b"1101011110111110"
    )
    port map (
        CK   => OPEN
      , I1   => n97
      , I2   => n98
      , I3   => wr_pointer_dd(4)
      , I4   => wr_pointer_dd(5)
      , L    => OPEN
      , O    => LOGIC_n226
      , R    => OPEN
    );

  i_LOGIC_lut_8 : NX_FE
    generic map (
        lut_table => b"1000100010001000"
    )
    port map (
        CK   => OPEN
      , I1   => out_ef_sig_reg
      , I2   => r_rd
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n228
      , R    => OPEN
    );

  i_LOGIC_lut_11 : NX_FE
    generic map (
        lut_table => b"1110011101111110"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n232
      , I2   => n101
      , I3   => n102
      , I4   => wr_pointer_dd(0)
      , L    => OPEN
      , O    => LOGIC_n231
      , R    => OPEN
    );

  i_LOGIC_lut_12 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n100
      , I2   => wr_pointer_dd(1)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n232
      , R    => OPEN
    );

  i_LOGIC_lut_14 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n98
      , I2   => wr_pointer_dd(3)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n234
      , R    => OPEN
    );

  i_LOGIC_lut_15 : NX_FE
    generic map (
        lut_table => b"1000000000001000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n236
      , I2   => LOGIC_n241
      , I3   => rd_pointer(5)
      , I4   => wr_pointer_dd(5)
      , L    => OPEN
      , O    => LOGIC_n235
      , R    => OPEN
    );

  i_LOGIC_lut_16 : NX_FE
    generic map (
        lut_table => b"1000100010001000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n237
      , I2   => LOGIC_n240
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n236
      , R    => OPEN
    );

  i_LOGIC_lut_17 : NX_FE
    generic map (
        lut_table => b"1000000000001000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n238
      , I2   => LOGIC_n239
      , I3   => rd_pointer(8)
      , I4   => wr_pointer_dd(8)
      , L    => OPEN
      , O    => LOGIC_n237
      , R    => OPEN
    );

  i_LOGIC_lut_18 : NX_FE
    generic map (
        lut_table => b"1000010000100001"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(1)
      , I2   => rd_pointer(7)
      , I3   => wr_pointer_dd(1)
      , I4   => wr_pointer_dd(7)
      , L    => OPEN
      , O    => LOGIC_n238
      , R    => OPEN
    );

  i_LOGIC_lut_19 : NX_FE
    generic map (
        lut_table => b"1000010000100001"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(0)
      , I2   => rd_pointer(4)
      , I3   => wr_pointer_dd(0)
      , I4   => wr_pointer_dd(4)
      , L    => OPEN
      , O    => LOGIC_n239
      , R    => OPEN
    );

  i_LOGIC_lut_20 : NX_FE
    generic map (
        lut_table => b"1000010000100001"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(3)
      , I2   => rd_pointer(6)
      , I3   => wr_pointer_dd(3)
      , I4   => wr_pointer_dd(6)
      , L    => OPEN
      , O    => LOGIC_n240
      , R    => OPEN
    );

  i_LOGIC_lut_21 : NX_FE
    generic map (
        lut_table => b"0100010001000100"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n228
      , I2   => LOGIC_n242
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => LOGIC_n241
      , R    => OPEN
    );

  i_LOGIC_lut_22 : NX_FE
    generic map (
        lut_table => b"1000010000100001"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(9)
      , I2   => rd_pointer(10)
      , I3   => wr_pointer_dd(9)
      , I4   => wr_pointer_dd(10)
      , L    => OPEN
      , O    => LOGIC_n242
      , R    => OPEN
    );

  i_LOGIC_lut_27 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n27
      , I2   => n28
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => n38
      , R    => OPEN
    );

  i_LOGIC_lut_29 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n29
      , I2   => n30
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => n40
      , R    => OPEN
    );

  i_LOGIC_lut_30 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n30
      , I2   => n31
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => n41
      , R    => OPEN
    );

  i_LOGIC_lut_31 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n31
      , I2   => n32
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => n42
      , R    => OPEN
    );

  i_LOGIC_lut_32 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => n32
      , I2   => n33
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => n43
      , R    => OPEN
    );

  i_LOGIC_lut_44 : NX_FE
    generic map (
        lut_table => b"0000000000000010"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n265
      , I2   => LOGIC_n269
      , I3   => LOGIC_n270
      , I4   => LOGIC_n271
      , L    => OPEN
      , O    => LOGIC_n264
      , R    => OPEN
    );

  i_LOGIC_lut_45 : NX_FE
    generic map (
        lut_table => b"1000001001000001"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n266
      , I2   => LOGIC_n268
      , I3   => rd_pointer_dd(6)
      , I4   => rd_pointer_dd(8)
      , L    => OPEN
      , O    => LOGIC_n265
      , R    => OPEN
    );

  i_LOGIC_lut_46 : NX_FE
    generic map (
        lut_table => b"0111110100101000"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_0_le_12
      , I2   => n24
      , I3   => n25
      , I4   => wr_pointer(8)
      , L    => OPEN
      , O    => LOGIC_n266
      , R    => OPEN
    );

  i_LOGIC_lut_47 : NX_FE
    generic map (
        lut_table => b"0001000000010000"
    )
    port map (
        CK   => OPEN
      , I1   => ff_sig
      , I2   => r_wclk_en_n
      , I3   => r_wr
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_0_le_12
      , R    => OPEN
    );

  i_LOGIC_lut_48 : NX_FE
    generic map (
        lut_table => b"0111110100101000"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_0_le_12
      , I2   => n26
      , I3   => n27
      , I4   => wr_pointer(6)
      , L    => OPEN
      , O    => LOGIC_n268
      , R    => OPEN
    );

  i_LOGIC_lut_49 : NX_FE
    generic map (
        lut_table => b"0100101101111000"
    )
    port map (
        CK   => OPEN
      , I1   => n41
      , I2   => wr_pointer_0_le_12
      , I3   => rd_pointer_dd(2)
      , I4   => wr_pointer(2)
      , L    => OPEN
      , O    => LOGIC_n269
      , R    => OPEN
    );

  i_LOGIC_lut_50 : NX_FE
    generic map (
        lut_table => b"0100101101111000"
    )
    port map (
        CK   => OPEN
      , I1   => n38
      , I2   => wr_pointer_0_le_12
      , I3   => rd_pointer_dd(5)
      , I4   => wr_pointer(5)
      , L    => OPEN
      , O    => LOGIC_n270
      , R    => OPEN
    );

  i_LOGIC_lut_51 : NX_FE
    generic map (
        lut_table => b"0100101101111000"
    )
    port map (
        CK   => OPEN
      , I1   => n42
      , I2   => wr_pointer_0_le_12
      , I3   => rd_pointer_dd(1)
      , I4   => wr_pointer(1)
      , L    => OPEN
      , O    => LOGIC_n271
      , R    => OPEN
    );

  i_LOGIC_lut_52 : NX_FE
    generic map (
        lut_table => b"0010101000001000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n273
      , I2   => wr_pointer_0_le_12
      , I3   => LOGIC_n276
      , I4   => LOGIC_n277
      , L    => OPEN
      , O    => LOGIC_n272
      , R    => OPEN
    );

  i_LOGIC_lut_53 : NX_FE
    generic map (
        lut_table => b"1000001001000001"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n274
      , I2   => LOGIC_n275
      , I3   => rd_pointer_dd(4)
      , I4   => rd_pointer_dd(7)
      , L    => OPEN
      , O    => LOGIC_n273
      , R    => OPEN
    );

  i_LOGIC_lut_54 : NX_FE
    generic map (
        lut_table => b"0111110100101000"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_0_le_12
      , I2   => n25
      , I3   => n26
      , I4   => wr_pointer(7)
      , L    => OPEN
      , O    => LOGIC_n274
      , R    => OPEN
    );

  i_LOGIC_lut_55 : NX_FE
    generic map (
        lut_table => b"0111110100101000"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_0_le_12
      , I2   => n28
      , I3   => n29
      , I4   => wr_pointer(4)
      , L    => OPEN
      , O    => LOGIC_n275
      , R    => OPEN
    );

  i_LOGIC_lut_56 : NX_FE
    generic map (
        lut_table => b"1110101101111101"
    )
    port map (
        CK   => OPEN
      , I1   => n23
      , I2   => n24
      , I3   => rd_pointer_dd(9)
      , I4   => rd_pointer_dd(10)
      , L    => OPEN
      , O    => LOGIC_n276
      , R    => OPEN
    );

  i_LOGIC_lut_57 : NX_FE
    generic map (
        lut_table => b"0001001001001000"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd(9)
      , I2   => rd_pointer_dd(10)
      , I3   => wr_pointer(9)
      , I4   => wr_pointer(10)
      , L    => OPEN
      , O    => LOGIC_n277
      , R    => OPEN
    );

  i_LOGIC_lut_58 : NX_FE
    generic map (
        lut_table => b"0100101101111000"
    )
    port map (
        CK   => OPEN
      , I1   => n43
      , I2   => wr_pointer_0_le_12
      , I3   => rd_pointer_dd(0)
      , I4   => wr_pointer(0)
      , L    => OPEN
      , O    => LOGIC_n278
      , R    => OPEN
    );

  i_LOGIC_lut_59 : NX_FE
    generic map (
        lut_table => b"0100101101111000"
    )
    port map (
        CK   => OPEN
      , I1   => n40
      , I2   => wr_pointer_0_le_12
      , I3   => rd_pointer_dd(3)
      , I4   => wr_pointer(3)
      , L    => OPEN
      , O    => LOGIC_n279
      , R    => OPEN
    );

  i_LOGIC_lut_60 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(9)
      , I2   => rd_pointer(10)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(9)
      , R    => OPEN
    );

  i_LOGIC_lut_61 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(8)
      , I2   => rd_pointer(9)
      , I3   => rd_pointer(10)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(8)
      , R    => OPEN
    );

  i_LOGIC_lut_62 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(7)
      , I2   => rd_pointer(8)
      , I3   => rd_pointer(9)
      , I4   => rd_pointer(10)
      , L    => OPEN
      , O    => rd_pointer_bin(7)
      , R    => OPEN
    );

  i_LOGIC_lut_63 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(9)
      , I2   => rd_pointer(6)
      , I3   => rd_pointer(7)
      , I4   => rd_pointer(8)
      , L    => OPEN
      , O    => rd_pointer_bin(6)
      , R    => OPEN
    );

  i_LOGIC_lut_64 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(7)
      , I2   => rd_pointer(5)
      , I3   => rd_pointer(6)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(5)
      , R    => OPEN
    );

  i_LOGIC_lut_65 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(7)
      , I2   => rd_pointer(4)
      , I3   => rd_pointer(5)
      , I4   => rd_pointer(6)
      , L    => OPEN
      , O    => rd_pointer_bin(4)
      , R    => OPEN
    );

  i_LOGIC_lut_66 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(5)
      , I2   => rd_pointer(3)
      , I3   => rd_pointer(4)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(3)
      , R    => OPEN
    );

  i_LOGIC_lut_68 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(2)
      , I2   => rd_pointer(1)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(1)
      , R    => OPEN
    );

  i_LOGIC_lut_69 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(2)
      , I2   => rd_pointer(0)
      , I3   => rd_pointer(1)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(0)
      , R    => OPEN
    );

  i_LOGIC_lut_71 : NX_FE
    generic map (
        lut_table => b"1000001000000000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n236
      , I2   => rd_pointer_bin(5)
      , I3   => wr_pointer_dd_bin(5)
      , I4   => LOGIC_n294_1
      , L    => OPEN
      , O    => LOGIC_n291_1
      , R    => OPEN
    );

  i_LOGIC_lut_72 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(8)
      , I2   => wr_pointer_dd(5)
      , I3   => wr_pointer_dd(6)
      , I4   => wr_pointer_dd(7)
      , L    => OPEN
      , O    => wr_pointer_dd_bin(5)
      , R    => OPEN
    );

  i_LOGIC_lut_73 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd(8)
      , I2   => wr_pointer_dd(9)
      , I3   => wr_pointer_dd(10)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(8)
      , R    => OPEN
    );

  i_LOGIC_lut_74 : NX_FE
    generic map (
        lut_table => b"0001001001001000"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(9)
      , I2   => rd_pointer(10)
      , I3   => wr_pointer_dd(9)
      , I4   => wr_pointer_dd(10)
      , L    => OPEN
      , O    => LOGIC_n294_1
      , R    => OPEN
    );

  i_LOGIC_lut_75 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(5)
      , I2   => wr_pointer_dd(2)
      , I3   => wr_pointer_dd(3)
      , I4   => wr_pointer_dd(4)
      , L    => OPEN
      , O    => wr_pointer_dd_bin(2)
      , R    => OPEN
    );

  i_LOGIC_lut_76 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd(9)
      , I2   => rd_pointer_dd(10)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(9)
      , R    => OPEN
    );

  i_LOGIC_lut_77 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd(8)
      , I2   => rd_pointer_dd(9)
      , I3   => rd_pointer_dd(10)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(8)
      , R    => OPEN
    );

  i_LOGIC_lut_78 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd(7)
      , I2   => rd_pointer_dd(8)
      , I3   => rd_pointer_dd(9)
      , I4   => rd_pointer_dd(10)
      , L    => OPEN
      , O    => rd_pointer_dd_bin(7)
      , R    => OPEN
    );

  i_LOGIC_lut_79 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(9)
      , I2   => rd_pointer_dd(6)
      , I3   => rd_pointer_dd(7)
      , I4   => rd_pointer_dd(8)
      , L    => OPEN
      , O    => rd_pointer_dd_bin(6)
      , R    => OPEN
    );

  i_LOGIC_lut_80 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(8)
      , I2   => rd_pointer_dd(5)
      , I3   => rd_pointer_dd(6)
      , I4   => rd_pointer_dd(7)
      , L    => OPEN
      , O    => rd_pointer_dd_bin(5)
      , R    => OPEN
    );

  i_LOGIC_lut_81 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(5)
      , I2   => rd_pointer_dd(4)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(4)
      , R    => OPEN
    );

  i_LOGIC_lut_82 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(5)
      , I2   => rd_pointer_dd(3)
      , I3   => rd_pointer_dd(4)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(3)
      , R    => OPEN
    );

  i_LOGIC_lut_83 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(5)
      , I2   => rd_pointer_dd(2)
      , I3   => rd_pointer_dd(3)
      , I4   => rd_pointer_dd(4)
      , L    => OPEN
      , O    => rd_pointer_dd_bin(2)
      , R    => OPEN
    );

  i_LOGIC_lut_84 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(2)
      , I2   => rd_pointer_dd(1)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(1)
      , R    => OPEN
    );

  i_LOGIC_lut_85 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_dd_bin(2)
      , I2   => rd_pointer_dd(0)
      , I3   => rd_pointer_dd(1)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_dd_bin(0)
      , R    => OPEN
    );

  i_LOGIC_lut_87 : NX_FE
    generic map (
        lut_table => b"1101000111100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(1)
      , I2   => LOGIC_n228
      , I3   => n102
      , I4   => rd_pointer(0)
      , L    => OPEN
      , O    => rd_addr(0)
      , R    => OPEN
    );

  i_LOGIC_lut_88 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(1)
      , I2   => LOGIC_n228
      , I3   => n101
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(1)
      , R    => OPEN
    );

  i_LOGIC_lut_89 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(2)
      , I2   => LOGIC_n228
      , I3   => n100
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(2)
      , R    => OPEN
    );

  i_LOGIC_lut_90 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(3)
      , I2   => LOGIC_n228
      , I3   => n99
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(3)
      , R    => OPEN
    );

  i_LOGIC_lut_91 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(4)
      , I2   => LOGIC_n228
      , I3   => n98
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(4)
      , R    => OPEN
    );

  i_LOGIC_lut_92 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(5)
      , I2   => LOGIC_n228
      , I3   => n97
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(5)
      , R    => OPEN
    );

  i_LOGIC_lut_93 : NX_FE
    generic map (
        lut_table => b"1110001011100010"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer_bin(6)
      , I2   => LOGIC_n228
      , I3   => n96
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(6)
      , R    => OPEN
    );

  i_LOGIC_lut_94 : NX_FE
    generic map (
        lut_table => b"1110010011100100"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n228
      , I2   => rd_pointer_bin(7)
      , I3   => n95
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(7)
      , R    => OPEN
    );

  i_LOGIC_lut_95 : NX_FE
    generic map (
        lut_table => b"1110010011100100"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n228
      , I2   => rd_pointer_bin(8)
      , I3   => n94
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_addr(8)
      , R    => OPEN
    );

  i_LOGIC_lut_96 : NX_FE
    generic map (
        lut_table => b"1000110111011000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n228
      , I2   => n93
      , I3   => rd_pointer(9)
      , I4   => rd_pointer(10)
      , L    => OPEN
      , O    => rd_addr(9)
      , R    => OPEN
    );

  i_LOGIC_lut_97 : NX_FE
    generic map (
        lut_table => b"0010000000100000"
    )
    port map (
        CK   => OPEN
      , I1   => out_ef_sig_reg
      , I2   => r_rclk_en_n
      , I3   => r_rd
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_0_le_1
      , R    => OPEN
    );

  i_LOGIC_lut_98 : NX_FE
    generic map (
        lut_table => b"1110111011101110"
    )
    port map (
        CK   => OPEN
      , I1   => rlevel_i(9)
      , I2   => rlevel_i(10)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => r_rhf
      , R    => OPEN
    );

  i_LOGIC_lut_99 : NX_FE
    generic map (
        lut_table => b"1110111011101110"
    )
    port map (
        CK   => OPEN
      , I1   => ff_sig
      , I2   => wlevel_i(9)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => r_whf
      , R    => OPEN
    );

  i_LOGIC_lut_100 : NX_FE
    generic map (
        lut_table => b"1000000010000000"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n321
      , I2   => LOGIC_n322
      , I3   => LOGIC_n323
      , I4   => OPEN
      , L    => OPEN
      , O    => wlevel_sig(10)
      , R    => OPEN
    );

  i_LOGIC_lut_101 : NX_FE
    generic map (
        lut_table => b"0000000000000010"
    )
    port map (
        CK   => OPEN
      , I1   => ff_sig
      , I2   => wlevel_i(0)
      , I3   => wlevel_i(1)
      , I4   => wlevel_i(4)
      , L    => OPEN
      , O    => LOGIC_n321
      , R    => OPEN
    );

  i_LOGIC_lut_102 : NX_FE
    generic map (
        lut_table => b"0000000000000001"
    )
    port map (
        CK   => OPEN
      , I1   => wlevel_i(6)
      , I2   => wlevel_i(7)
      , I3   => wlevel_i(8)
      , I4   => wlevel_i(9)
      , L    => OPEN
      , O    => LOGIC_n322
      , R    => OPEN
    );

  i_LOGIC_lut_103 : NX_FE
    generic map (
        lut_table => b"0000000000000001"
    )
    port map (
        CK   => OPEN
      , I1   => wlevel_i(2)
      , I2   => wlevel_i(3)
      , I3   => wlevel_i(5)
      , I4   => wlevel_i(10)
      , L    => OPEN
      , O    => LOGIC_n323
      , R    => OPEN
    );

  i_LOGIC_lut_104 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(2)
      , I2   => wr_pointer(0)
      , I3   => wr_pointer(1)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(0)
      , R    => OPEN
    );

  i_LOGIC_lut_106 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(8)
      , I2   => wr_pointer(5)
      , I3   => wr_pointer(6)
      , I4   => wr_pointer(7)
      , L    => OPEN
      , O    => wr_pointer_bin(5)
      , R    => OPEN
    );

  i_LOGIC_lut_107 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer(8)
      , I2   => wr_pointer(9)
      , I3   => wr_pointer(10)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(8)
      , R    => OPEN
    );

  i_LOGIC_lut_108 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(2)
      , I2   => wr_pointer(1)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(1)
      , R    => OPEN
    );

  i_LOGIC_lut_109 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(5)
      , I2   => wr_pointer(3)
      , I3   => wr_pointer(4)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(3)
      , R    => OPEN
    );

  i_LOGIC_lut_110 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(5)
      , I2   => wr_pointer(4)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(4)
      , R    => OPEN
    );

  i_LOGIC_lut_111 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_bin(9)
      , I2   => wr_pointer(6)
      , I3   => wr_pointer(7)
      , I4   => wr_pointer(8)
      , L    => OPEN
      , O    => wr_pointer_bin(6)
      , R    => OPEN
    );

  i_LOGIC_lut_112 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer(9)
      , I2   => wr_pointer(10)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(9)
      , R    => OPEN
    );

  i_LOGIC_lut_113 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer(7)
      , I2   => wr_pointer(8)
      , I3   => wr_pointer(9)
      , I4   => wr_pointer(10)
      , L    => OPEN
      , O    => wr_pointer_bin(7)
      , R    => OPEN
    );

  i_LOGIC_lut_114 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(2)
      , I2   => wr_pointer_dd(0)
      , I3   => wr_pointer_dd(1)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(0)
      , R    => OPEN
    );

  i_LOGIC_lut_115 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(2)
      , I2   => wr_pointer_dd(1)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(1)
      , R    => OPEN
    );

  i_LOGIC_lut_116 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(5)
      , I2   => wr_pointer_dd(3)
      , I3   => wr_pointer_dd(4)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(3)
      , R    => OPEN
    );

  i_LOGIC_lut_117 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(5)
      , I2   => wr_pointer_dd(4)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(4)
      , R    => OPEN
    );

  i_LOGIC_lut_118 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd_bin(9)
      , I2   => wr_pointer_dd(6)
      , I3   => wr_pointer_dd(7)
      , I4   => wr_pointer_dd(8)
      , L    => OPEN
      , O    => wr_pointer_dd_bin(6)
      , R    => OPEN
    );

  i_LOGIC_lut_119 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd(9)
      , I2   => wr_pointer_dd(10)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_dd_bin(9)
      , R    => OPEN
    );

  i_LOGIC_lut_120 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer_dd(7)
      , I2   => wr_pointer_dd(8)
      , I3   => wr_pointer_dd(9)
      , I4   => wr_pointer_dd(10)
      , L    => OPEN
      , O    => wr_pointer_dd_bin(7)
      , R    => OPEN
    );

  i_LOGIC_lut_122 : NX_FE
    generic map (
        lut_table => b"0101010101010101"
    )
    port map (
        CK   => OPEN
      , I1   => r_rclk_en_n
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => le_67_inv
      , R    => OPEN
    );

  i_LOGIC_lut_123 : NX_FE
    generic map (
        lut_table => b"0101010101010101"
    )
    port map (
        CK   => OPEN
      , I1   => out_ef_sig_reg
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => ef_sig
      , R    => OPEN
    );

  i_LessThan_aff_lut_0 : NX_FE
    generic map (
        lut_table => b"1111100011111000"
    )
    port map (
        CK   => OPEN
      , I1   => LessThan_aff_n15
      , I2   => LessThan_aff_n16
      , I3   => wlevel_sig(10)
      , I4   => OPEN
      , L    => OPEN
      , O    => r_aff
      , R    => OPEN
    );

  i_LessThan_aff_lut_1 : NX_FE
    generic map (
        lut_table => b"1000000000000000"
    )
    port map (
        CK   => OPEN
      , I1   => wlevel_i(6)
      , I2   => wlevel_i(7)
      , I3   => wlevel_i(8)
      , I4   => wlevel_i(9)
      , L    => OPEN
      , O    => LessThan_aff_n15
      , R    => OPEN
    );

  i_LessThan_aff_lut_2 : NX_FE
    generic map (
        lut_table => b"1000000000000000"
    )
    port map (
        CK   => OPEN
      , I1   => wlevel_i(2)
      , I2   => wlevel_i(3)
      , I3   => wlevel_i(4)
      , I4   => wlevel_i(5)
      , L    => OPEN
      , O    => LessThan_aff_n16
      , R    => OPEN
    );

  i_ef_sig_reg : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0000000011101111"
    )
    port map (
        CK   => rg_rclk
      , I1   => out_lut_fcp_186
      , I2   => out_lut_fcp_191
      , I3   => out_lut_fcp_189
      , I4   => out_lut_fcp_147
      , L    => rg_rclk_en_n_inv
      , O    => out_ef_sig_reg
      , R    => rg_rclk_rst_inv
    );

  i_ff_sig_reg : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0000000000001000"
    )
    port map (
        CK   => rg_wclk
      , I1   => LOGIC_n264
      , I2   => LOGIC_n272
      , I3   => LOGIC_n278
      , I4   => LOGIC_n279
      , L    => rg_wclk_en_n_inv
      , O    => ff_sig
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_bin_2_fcp_310 : NX_FE
    generic map (
        lut_table => b"0011010100110101"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_309
      , I2   => out_lut_fcp_307
      , I3   => rd_pointer_bin(7)
      , I4   => OPEN
      , L    => OPEN
      , O    => rd_pointer_bin(2)
      , R    => OPEN
    );

  i_rd_pointer_d_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(0)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(0)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(1)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(1)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(2)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(2)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(3)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(3)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(4)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(4)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(5)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(5)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(6)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(6)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(7)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(7)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(8)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(8)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(9)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(9)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_d_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer(10)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_d(10)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(0)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(0)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(1)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(1)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(2)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(2)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(3)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(3)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(4)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(4)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(5)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(5)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(6)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(6)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(7)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(7)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(8)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(8)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(9)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(9)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_dd_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => rd_pointer_d(10)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => rd_pointer_dd(10)
      , R    => rg_wclk_rst_inv
    );

  i_rd_pointer_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n101
      , I2   => n102
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(0)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n100
      , I2   => n101
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(1)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n99
      , I2   => n100
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(2)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n98
      , I2   => n99
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(3)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n97
      , I2   => n98
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(4)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n96
      , I2   => n97
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(5)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n95
      , I2   => n96
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(6)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n94
      , I2   => n95
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(7)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n93
      , I2   => n94
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(8)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_rclk
      , I1   => n92
      , I2   => n93
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(9)
      , R    => rg_rclk_rst_inv
    );

  i_rd_pointer_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => n92
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rd_pointer_0_le_1
      , O    => rd_pointer(10)
      , R    => rg_rclk_rst_inv
    );

  i_rlevel_i_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1000001010000010"
    )
    port map (
        CK   => rg_rclk
      , I1   => LOGIC_n291_1
      , I2   => rd_pointer_bin(2)
      , I3   => wr_pointer_dd_bin(2)
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => rlevel_i(10)
      , R    => rg_rclk_rst_inv
    );

  i_wlevel_i_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n419
      , I2   => n430
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_wclk_en_n_inv
      , O    => wlevel_i(10)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_bin_2_fcp_305 : NX_FE
    generic map (
        lut_table => b"0011010100110101"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_304
      , I2   => out_lut_fcp_302
      , I3   => wr_pointer_bin(8)
      , I4   => OPEN
      , L    => OPEN
      , O    => wr_pointer_bin(2)
      , R    => OPEN
    );

  i_wr_pointer_d_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(0)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(0)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(1)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(1)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(2)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(2)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(3)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(3)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(4)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(4)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(5)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(5)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(6)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(6)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(7)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(7)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(8)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(8)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(9)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(9)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_d_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer(10)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_d(10)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(0)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(0)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(1)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(1)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(2)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(2)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(3)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(3)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(4)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(4)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(5)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(5)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(6)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(6)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(7)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(7)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(8)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(8)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(9)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(9)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_dd_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_rclk
      , I1   => wr_pointer_d(10)
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => rg_rclk_en_n_inv
      , O    => wr_pointer_dd(10)
      , R    => rg_rclk_rst_inv
    );

  i_wr_pointer_reg_0 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n43
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(0)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_1 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n42
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(1)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_2 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n41
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(2)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_3 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n40
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(3)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_4 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n28
      , I2   => n29
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(4)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_5 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n38
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(5)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_6 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n26
      , I2   => n27
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(6)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_7 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n25
      , I2   => n26
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(7)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_8 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n24
      , I2   => n25
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(8)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_9 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"0110011001100110"
    )
    port map (
        CK   => rg_wclk
      , I1   => n23
      , I2   => n24
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(9)
      , R    => rg_wclk_rst_inv
    );

  i_wr_pointer_reg_10 : NX_FE
    generic map (
        dff_edge => '0'
      , dff_init => '1'
      , dff_load => '1'
      , dff_mode => '1'
      , dff_sync => '0'
      , lut_table => b"1010101010101010"
    )
    port map (
        CK   => rg_wclk
      , I1   => n23
      , I2   => OPEN
      , I3   => OPEN
      , I4   => OPEN
      , L    => wr_pointer_0_le_12
      , O    => wr_pointer(10)
      , R    => rg_wclk_rst_inv
    );

  i_x_46n12_fcp_147 : NX_FE
    generic map (
        lut_table => b"1001000010010000"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(2)
      , I2   => wr_pointer_dd(2)
      , I3   => LOGIC_n235
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_147
      , R    => OPEN
    );

  i_x_60n23_fcp_191 : NX_FE
    generic map (
        lut_table => b"1110101101111101"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_190
      , I2   => n95
      , I3   => wr_pointer_dd(7)
      , I4   => n94
      , L    => OPEN
      , O    => out_lut_fcp_191
      , R    => OPEN
    );

  i_x_60n24_fcp_190 : NX_FE
    generic map (
        lut_table => b"1001100110011001"
    )
    port map (
        CK   => OPEN
      , I1   => n93
      , I2   => wr_pointer_dd(8)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_190
      , R    => OPEN
    );

  i_x_60n25_fcp_189 : NX_FE
    generic map (
        lut_table => b"0000000100000000"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_188
      , I2   => out_lut_fcp_187
      , I3   => LOGIC_n231
      , I4   => LOGIC_n228
      , L    => OPEN
      , O    => out_lut_fcp_189
      , R    => OPEN
    );

  i_x_60n26_fcp_188 : NX_FE
    generic map (
        lut_table => b"1110011101111110"
    )
    port map (
        CK   => OPEN
      , I1   => n99
      , I2   => LOGIC_n234
      , I3   => n100
      , I4   => wr_pointer_dd(2)
      , L    => OPEN
      , O    => out_lut_fcp_188
      , R    => OPEN
    );

  i_x_60n27_fcp_187 : NX_FE
    generic map (
        lut_table => b"1100111111111010"
    )
    port map (
        CK   => OPEN
      , I1   => LOGIC_n226
      , I2   => LOGIC_n224
      , I3   => LOGIC_n225
      , I4   => n96
      , L    => OPEN
      , O    => out_lut_fcp_187
      , R    => OPEN
    );

  i_x_60n28_fcp_186 : NX_FE
    generic map (
        lut_table => b"1110011101111110"
    )
    port map (
        CK   => OPEN
      , I1   => n92
      , I2   => wr_pointer_dd(10)
      , I3   => n93
      , I4   => wr_pointer_dd(9)
      , L    => OPEN
      , O    => out_lut_fcp_186
      , R    => OPEN
    );

  i_x_103n11_fcp_304 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_303
      , I2   => wr_pointer(3)
      , I3   => wr_pointer(4)
      , I4   => wr_pointer(2)
      , L    => OPEN
      , O    => out_lut_fcp_304
      , R    => OPEN
    );

  i_x_103n12_fcp_303 : NX_FE
    generic map (
        lut_table => b"0110100101101001"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer(7)
      , I2   => wr_pointer(5)
      , I3   => wr_pointer(6)
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_303
      , R    => OPEN
    );

  i_x_103n13_fcp_302 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_301
      , I2   => wr_pointer(3)
      , I3   => wr_pointer(4)
      , I4   => wr_pointer(2)
      , L    => OPEN
      , O    => out_lut_fcp_302
      , R    => OPEN
    );

  i_x_103n14_fcp_301 : NX_FE
    generic map (
        lut_table => b"1001011010010110"
    )
    port map (
        CK   => OPEN
      , I1   => wr_pointer(7)
      , I2   => wr_pointer(5)
      , I3   => wr_pointer(6)
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_301
      , R    => OPEN
    );

  i_x_104n10_fcp_309 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_308
      , I2   => rd_pointer(3)
      , I3   => rd_pointer(4)
      , I4   => rd_pointer(2)
      , L    => OPEN
      , O    => out_lut_fcp_309
      , R    => OPEN
    );

  i_x_104n11_fcp_308 : NX_FE
    generic map (
        lut_table => b"1001100110011001"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(5)
      , I2   => rd_pointer(6)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_308
      , R    => OPEN
    );

  i_x_104n12_fcp_307 : NX_FE
    generic map (
        lut_table => b"0110100110010110"
    )
    port map (
        CK   => OPEN
      , I1   => out_lut_fcp_306
      , I2   => rd_pointer(3)
      , I3   => rd_pointer(4)
      , I4   => rd_pointer(2)
      , L    => OPEN
      , O    => out_lut_fcp_307
      , R    => OPEN
    );

  i_x_104n13_fcp_306 : NX_FE
    generic map (
        lut_table => b"0110011001100110"
    )
    port map (
        CK   => OPEN
      , I1   => rd_pointer(5)
      , I2   => rd_pointer(6)
      , I3   => OPEN
      , I4   => OPEN
      , L    => OPEN
      , O    => out_lut_fcp_306
      , R    => OPEN
    );

  i_fifo_ram_mem_ram0_0_0_0 : NX_RAM
    -- ref_model => "twoport_ram(X5CDB8E97)_mem"
    -- ref_inst  => "fifo_ram|mem"
    -- ref_blob  => "d:0:1 s:0:1 w:0:1 M:1024:16 R:1:18"
    -- std_mode => "FAST_2kx18"
    generic map (
        mcka_edge => '0'
      , mckb_edge => '0'
      , pcka_edge => '0'
      , pckb_edge => '0'
      , raw_config0 => b"0000"
      , raw_config1 => b"0011100100100100"
    )
    port map (
        AA1  => wr_pointer_bin(0)
      , AA2  => wr_pointer_bin(1)
      , AA3  => wr_pointer_bin(2)
      , AA4  => wr_pointer_bin(3)
      , AA5  => wr_pointer_bin(4)
      , AA6  => wr_pointer_bin(5)
      , AA7  => wr_pointer_bin(6)
      , AA8  => wr_pointer_bin(7)
      , AA9  => wr_pointer_bin(8)
      , AA10 => wr_pointer_bin(9)
      , AA11 => OPEN
      , AA12 => OPEN
      , AA13 => OPEN
      , AA14 => OPEN
      , AA15 => OPEN
      , AA16 => OPEN
      , ACK  => rg_wclk
      , ACKC => rg_wclk
      , ACKD => OPEN
      , ACKR => OPEN
      , ACOR => OPEN
      , ACS  => wr_pointer_0_le_12
      , AERR => OPEN
      , AI1  => r_din(0)
      , AI2  => r_din(1)
      , AI3  => r_din(2)
      , AI4  => r_din(3)
      , AI5  => r_din(4)
      , AI6  => r_din(5)
      , AI7  => r_din(6)
      , AI8  => r_din(7)
      , AI9  => r_din(8)
      , AI10 => r_din(9)
      , AI11 => r_din(10)
      , AI12 => r_din(11)
      , AI13 => r_din(12)
      , AI14 => r_din(13)
      , AI15 => r_din(14)
      , AI16 => r_din(15)
      , AI17 => OPEN
      , AI18 => OPEN
      , AI19 => OPEN
      , AI20 => OPEN
      , AI21 => OPEN
      , AI22 => OPEN
      , AI23 => OPEN
      , AI24 => OPEN
      , AO1  => OPEN
      , AO2  => OPEN
      , AO3  => OPEN
      , AO4  => OPEN
      , AO5  => OPEN
      , AO6  => OPEN
      , AO7  => OPEN
      , AO8  => OPEN
      , AO9  => OPEN
      , AO10 => OPEN
      , AO11 => OPEN
      , AO12 => OPEN
      , AO13 => OPEN
      , AO14 => OPEN
      , AO15 => OPEN
      , AO16 => OPEN
      , AO17 => OPEN
      , AO18 => OPEN
      , AO19 => OPEN
      , AO20 => OPEN
      , AO21 => OPEN
      , AO22 => OPEN
      , AO23 => OPEN
      , AO24 => OPEN
      , AR   => OPEN
      , AWE  => wr_pointer_0_le_12
      , BA1  => rd_addr(0)
      , BA2  => rd_addr(1)
      , BA3  => rd_addr(2)
      , BA4  => rd_addr(3)
      , BA5  => rd_addr(4)
      , BA6  => rd_addr(5)
      , BA7  => rd_addr(6)
      , BA8  => rd_addr(7)
      , BA9  => rd_addr(8)
      , BA10 => rd_addr(9)
      , BA11 => OPEN
      , BA12 => OPEN
      , BA13 => OPEN
      , BA14 => OPEN
      , BA15 => OPEN
      , BA16 => OPEN
      , BCK  => rg_rclk
      , BCKC => rg_rclk
      , BCKD => OPEN
      , BCKR => OPEN
      , BCOR => OPEN
      , BCS  => le_67_inv
      , BERR => OPEN
      , BI1  => OPEN
      , BI2  => OPEN
      , BI3  => OPEN
      , BI4  => OPEN
      , BI5  => OPEN
      , BI6  => OPEN
      , BI7  => OPEN
      , BI8  => OPEN
      , BI9  => OPEN
      , BI10 => OPEN
      , BI11 => OPEN
      , BI12 => OPEN
      , BI13 => OPEN
      , BI14 => OPEN
      , BI15 => OPEN
      , BI16 => OPEN
      , BI17 => OPEN
      , BI18 => OPEN
      , BI19 => OPEN
      , BI20 => OPEN
      , BI21 => OPEN
      , BI22 => OPEN
      , BI23 => OPEN
      , BI24 => OPEN
      , BO1  => r_dout(0)
      , BO2  => r_dout(1)
      , BO3  => r_dout(2)
      , BO4  => r_dout(3)
      , BO5  => r_dout(4)
      , BO6  => r_dout(5)
      , BO7  => r_dout(6)
      , BO8  => r_dout(7)
      , BO9  => r_dout(8)
      , BO10 => r_dout(9)
      , BO11 => r_dout(10)
      , BO12 => r_dout(11)
      , BO13 => r_dout(12)
      , BO14 => r_dout(13)
      , BO15 => r_dout(14)
      , BO16 => r_dout(15)
      , BO17 => OPEN
      , BO18 => OPEN
      , BO19 => OPEN
      , BO20 => OPEN
      , BO21 => OPEN
      , BO22 => OPEN
      , BO23 => OPEN
      , BO24 => OPEN
      , BR   => OPEN
      , BWE  => OPEN
    );

  i_aef : NX_IOB_O
    port map (
        C    => rt_aef
      , I    => ro_aef
      , IO   => aef
    );

  i_aff : NX_IOB_O
    port map (
        C    => rt_aff
      , I    => ro_aff
      , IO   => aff
    );

  i_din_0 : NX_IOB_I
    port map (
        IO   => din(0)
      , O    => ri_din(0)
    );

  i_din_1 : NX_IOB_I
    port map (
        IO   => din(1)
      , O    => ri_din(1)
    );

  i_din_2 : NX_IOB_I
    port map (
        IO   => din(2)
      , O    => ri_din(2)
    );

  i_din_3 : NX_IOB_I
    port map (
        IO   => din(3)
      , O    => ri_din(3)
    );

  i_din_4 : NX_IOB_I
    port map (
        IO   => din(4)
      , O    => ri_din(4)
    );

  i_din_5 : NX_IOB_I
    port map (
        IO   => din(5)
      , O    => ri_din(5)
    );

  i_din_6 : NX_IOB_I
    port map (
        IO   => din(6)
      , O    => ri_din(6)
    );

  i_din_7 : NX_IOB_I
    port map (
        IO   => din(7)
      , O    => ri_din(7)
    );

  i_din_8 : NX_IOB_I
    port map (
        IO   => din(8)
      , O    => ri_din(8)
    );

  i_din_9 : NX_IOB_I
    port map (
        IO   => din(9)
      , O    => ri_din(9)
    );

  i_din_10 : NX_IOB_I
    port map (
        IO   => din(10)
      , O    => ri_din(10)
    );

  i_din_11 : NX_IOB_I
    port map (
        IO   => din(11)
      , O    => ri_din(11)
    );

  i_din_12 : NX_IOB_I
    port map (
        IO   => din(12)
      , O    => ri_din(12)
    );

  i_din_13 : NX_IOB_I
    port map (
        IO   => din(13)
      , O    => ri_din(13)
    );

  i_din_14 : NX_IOB_I
    port map (
        IO   => din(14)
      , O    => ri_din(14)
    );

  i_din_15 : NX_IOB_I
    port map (
        IO   => din(15)
      , O    => ri_din(15)
    );

  i_dout_0 : NX_IOB_O
    port map (
        C    => rt_dout(0)
      , I    => ro_dout(0)
      , IO   => dout(0)
    );

  i_dout_1 : NX_IOB_O
    port map (
        C    => rt_dout(1)
      , I    => ro_dout(1)
      , IO   => dout(1)
    );

  i_dout_2 : NX_IOB_O
    port map (
        C    => rt_dout(2)
      , I    => ro_dout(2)
      , IO   => dout(2)
    );

  i_dout_3 : NX_IOB_O
    port map (
        C    => rt_dout(3)
      , I    => ro_dout(3)
      , IO   => dout(3)
    );

  i_dout_4 : NX_IOB_O
    port map (
        C    => rt_dout(4)
      , I    => ro_dout(4)
      , IO   => dout(4)
    );

  i_dout_5 : NX_IOB_O
    port map (
        C    => rt_dout(5)
      , I    => ro_dout(5)
      , IO   => dout(5)
    );

  i_dout_6 : NX_IOB_O
    port map (
        C    => rt_dout(6)
      , I    => ro_dout(6)
      , IO   => dout(6)
    );

  i_dout_7 : NX_IOB_O
    port map (
        C    => rt_dout(7)
      , I    => ro_dout(7)
      , IO   => dout(7)
    );

  i_dout_8 : NX_IOB_O
    port map (
        C    => rt_dout(8)
      , I    => ro_dout(8)
      , IO   => dout(8)
    );

  i_dout_9 : NX_IOB_O
    port map (
        C    => rt_dout(9)
      , I    => ro_dout(9)
      , IO   => dout(9)
    );

  i_dout_10 : NX_IOB_O
    port map (
        C    => rt_dout(10)
      , I    => ro_dout(10)
      , IO   => dout(10)
    );

  i_dout_11 : NX_IOB_O
    port map (
        C    => rt_dout(11)
      , I    => ro_dout(11)
      , IO   => dout(11)
    );

  i_dout_12 : NX_IOB_O
    port map (
        C    => rt_dout(12)
      , I    => ro_dout(12)
      , IO   => dout(12)
    );

  i_dout_13 : NX_IOB_O
    port map (
        C    => rt_dout(13)
      , I    => ro_dout(13)
      , IO   => dout(13)
    );

  i_dout_14 : NX_IOB_O
    port map (
        C    => rt_dout(14)
      , I    => ro_dout(14)
      , IO   => dout(14)
    );

  i_dout_15 : NX_IOB_O
    port map (
        C    => rt_dout(15)
      , I    => ro_dout(15)
      , IO   => dout(15)
    );

  i_ef : NX_IOB_O
    port map (
        C    => rt_ef
      , I    => ro_ef
      , IO   => ef
    );

  i_ff : NX_IOB_O
    port map (
        C    => rt_ff
      , I    => ro_ff
      , IO   => ff
    );

  i_rclk : NX_IOB_I
    port map (
        IO   => rclk
      , O    => ri_rclk
    );

  i_rclk_en_n : NX_IOB_I
    port map (
        IO   => rclk_en_n
      , O    => ri_rclk_en_n
    );

  i_rclk_rst : NX_IOB_I
    port map (
        IO   => rclk_rst
      , O    => ri_rclk_rst
    );

  i_rd : NX_IOB_I
    port map (
        IO   => rd
      , O    => ri_rd
    );

  i_rhf : NX_IOB_O
    port map (
        C    => rt_rhf
      , I    => ro_rhf
      , IO   => rhf
    );

  i_rlevel_0 : NX_IOB_O
    port map (
        C    => rt_rlevel(0)
      , I    => ro_rlevel(0)
      , IO   => rlevel(0)
    );

  i_rlevel_1 : NX_IOB_O
    port map (
        C    => rt_rlevel(1)
      , I    => ro_rlevel(1)
      , IO   => rlevel(1)
    );

  i_rlevel_2 : NX_IOB_O
    port map (
        C    => rt_rlevel(2)
      , I    => ro_rlevel(2)
      , IO   => rlevel(2)
    );

  i_rlevel_3 : NX_IOB_O
    port map (
        C    => rt_rlevel(3)
      , I    => ro_rlevel(3)
      , IO   => rlevel(3)
    );

  i_rlevel_4 : NX_IOB_O
    port map (
        C    => rt_rlevel(4)
      , I    => ro_rlevel(4)
      , IO   => rlevel(4)
    );

  i_rlevel_5 : NX_IOB_O
    port map (
        C    => rt_rlevel(5)
      , I    => ro_rlevel(5)
      , IO   => rlevel(5)
    );

  i_rlevel_6 : NX_IOB_O
    port map (
        C    => rt_rlevel(6)
      , I    => ro_rlevel(6)
      , IO   => rlevel(6)
    );

  i_rlevel_7 : NX_IOB_O
    port map (
        C    => rt_rlevel(7)
      , I    => ro_rlevel(7)
      , IO   => rlevel(7)
    );

  i_rlevel_8 : NX_IOB_O
    port map (
        C    => rt_rlevel(8)
      , I    => ro_rlevel(8)
      , IO   => rlevel(8)
    );

  i_rlevel_9 : NX_IOB_O
    port map (
        C    => rt_rlevel(9)
      , I    => ro_rlevel(9)
      , IO   => rlevel(9)
    );

  i_rlevel_10 : NX_IOB_O
    port map (
        C    => rt_rlevel(10)
      , I    => ro_rlevel(10)
      , IO   => rlevel(10)
    );

  i_wclk : NX_IOB_I
    port map (
        IO   => wclk
      , O    => ri_wclk
    );

  i_wclk_en_n : NX_IOB_I
    port map (
        IO   => wclk_en_n
      , O    => ri_wclk_en_n
    );

  i_wclk_rst : NX_IOB_I
    port map (
        IO   => wclk_rst
      , O    => ri_wclk_rst
    );

  i_whf : NX_IOB_O
    port map (
        C    => rt_whf
      , I    => ro_whf
      , IO   => whf
    );

  i_wlevel_0 : NX_IOB_O
    port map (
        C    => rt_wlevel(0)
      , I    => ro_wlevel(0)
      , IO   => wlevel(0)
    );

  i_wlevel_1 : NX_IOB_O
    port map (
        C    => rt_wlevel(1)
      , I    => ro_wlevel(1)
      , IO   => wlevel(1)
    );

  i_wlevel_2 : NX_IOB_O
    port map (
        C    => rt_wlevel(2)
      , I    => ro_wlevel(2)
      , IO   => wlevel(2)
    );

  i_wlevel_3 : NX_IOB_O
    port map (
        C    => rt_wlevel(3)
      , I    => ro_wlevel(3)
      , IO   => wlevel(3)
    );

  i_wlevel_4 : NX_IOB_O
    port map (
        C    => rt_wlevel(4)
      , I    => ro_wlevel(4)
      , IO   => wlevel(4)
    );

  i_wlevel_5 : NX_IOB_O
    port map (
        C    => rt_wlevel(5)
      , I    => ro_wlevel(5)
      , IO   => wlevel(5)
    );

  i_wlevel_6 : NX_IOB_O
    port map (
        C    => rt_wlevel(6)
      , I    => ro_wlevel(6)
      , IO   => wlevel(6)
    );

  i_wlevel_7 : NX_IOB_O
    port map (
        C    => rt_wlevel(7)
      , I    => ro_wlevel(7)
      , IO   => wlevel(7)
    );

  i_wlevel_8 : NX_IOB_O
    port map (
        C    => rt_wlevel(8)
      , I    => ro_wlevel(8)
      , IO   => wlevel(8)
    );

  i_wlevel_9 : NX_IOB_O
    port map (
        C    => rt_wlevel(9)
      , I    => ro_wlevel(9)
      , IO   => wlevel(9)
    );

  i_wlevel_10 : NX_IOB_O
    port map (
        C    => rt_wlevel(10)
      , I    => ro_wlevel(10)
      , IO   => wlevel(10)
    );

  i_wr : NX_IOB_I
    port map (
        IO   => wr
      , O    => ri_wr
    );

  i_wfg_B_rclk : NX_WFG_L
    generic map (
        wfg_edge => '0'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_rclk
      , ZO   => rg_rclk
    );

  i_wfg_B_wclk : NX_WFG_L
    generic map (
        wfg_edge => '0'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_wclk
      , ZO   => rg_wclk
    );

  i_wfg_I_rclk_en_n : NX_WFG_L
    generic map (
        wfg_edge => '1'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_rclk_en_n
      , ZO   => rg_rclk_en_n_inv
    );

  i_wfg_I_rclk_rst : NX_WFG_L
    generic map (
        wfg_edge => '1'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_rclk_rst
      , ZO   => rg_rclk_rst_inv
    );

  i_wfg_I_wclk_en_n : NX_WFG_L
    generic map (
        wfg_edge => '1'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_wclk_en_n
      , ZO   => rg_wclk_en_n_inv
    );

  i_wfg_I_wclk_rst : NX_WFG_L
    generic map (
        wfg_edge => '1'
    )
    port map (
        R    => OPEN
      , RDY  => OPEN
      , SI   => OPEN
      , SO   => OPEN
      , ZI   => ri_wclk_rst
      , ZO   => rg_wclk_rst_inv
    );

  i_sdrv_aef : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_aef
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_aef
      , EL   => OPEN
      , EO   => ro_aef
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_aff : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_aff
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_aff
      , EL   => OPEN
      , EO   => ro_aff
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_0 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(0)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(0)
      , RL   => OPEN
      , RO   => r_din(0)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_1 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(1)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(1)
      , RL   => OPEN
      , RO   => r_din(1)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_2 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(2)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(2)
      , RL   => OPEN
      , RO   => r_din(2)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_3 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(3)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(3)
      , RL   => OPEN
      , RO   => r_din(3)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_4 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(4)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(4)
      , RL   => OPEN
      , RO   => r_din(4)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_5 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(5)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(5)
      , RL   => OPEN
      , RO   => r_din(5)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_6 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(6)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(6)
      , RL   => OPEN
      , RO   => r_din(6)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_7 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(7)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(7)
      , RL   => OPEN
      , RO   => r_din(7)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_8 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(8)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(8)
      , RL   => OPEN
      , RO   => r_din(8)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_9 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(9)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(9)
      , RL   => OPEN
      , RO   => r_din(9)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_10 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(10)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(10)
      , RL   => OPEN
      , RO   => r_din(10)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_11 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(11)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(11)
      , RL   => OPEN
      , RO   => r_din(11)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_12 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(12)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(12)
      , RL   => OPEN
      , RO   => r_din(12)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_13 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(13)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(13)
      , RL   => OPEN
      , RO   => r_din(13)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_14 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(14)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(14)
      , RL   => OPEN
      , RO   => r_din(14)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_din_15 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_din(15)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_din(15)
      , RL   => OPEN
      , RO   => r_din(15)
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_0 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(0)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(0)
      , EL   => OPEN
      , EO   => ro_dout(0)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_1 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(1)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(1)
      , EL   => OPEN
      , EO   => ro_dout(1)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_2 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(2)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(2)
      , EL   => OPEN
      , EO   => ro_dout(2)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_3 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(3)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(3)
      , EL   => OPEN
      , EO   => ro_dout(3)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_4 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(4)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(4)
      , EL   => OPEN
      , EO   => ro_dout(4)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_5 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(5)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(5)
      , EL   => OPEN
      , EO   => ro_dout(5)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_6 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(6)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(6)
      , EL   => OPEN
      , EO   => ro_dout(6)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_7 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(7)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(7)
      , EL   => OPEN
      , EO   => ro_dout(7)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_8 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(8)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(8)
      , EL   => OPEN
      , EO   => ro_dout(8)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_9 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(9)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(9)
      , EL   => OPEN
      , EO   => ro_dout(9)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_10 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(10)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(10)
      , EL   => OPEN
      , EO   => ro_dout(10)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_11 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(11)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(11)
      , EL   => OPEN
      , EO   => ro_dout(11)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_12 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(12)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(12)
      , EL   => OPEN
      , EO   => ro_dout(12)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_13 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(13)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(13)
      , EL   => OPEN
      , EO   => ro_dout(13)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_14 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(14)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(14)
      , EL   => OPEN
      , EO   => ro_dout(14)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_dout_15 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_dout(15)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_dout(15)
      , EL   => OPEN
      , EO   => ro_dout(15)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_ef : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_ef
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => ef_sig
      , EL   => OPEN
      , EO   => ro_ef
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_ff : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_ff
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => ff_sig
      , EL   => OPEN
      , EO   => ro_ff
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rclk : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rclk
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_rclk
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rclk_en_n : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rclk_en_n
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_rclk_en_n
      , RL   => OPEN
      , RO   => r_rclk_en_n
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rclk_rst : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rclk_rst
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_rclk_rst
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rd : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rd
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_rd
      , RL   => OPEN
      , RO   => r_rd
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rhf : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rhf
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_rhf
      , EL   => OPEN
      , EO   => ro_rhf
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_0 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(0)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(0)
      , EL   => OPEN
      , EO   => ro_rlevel(0)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_1 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(1)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(1)
      , EL   => OPEN
      , EO   => ro_rlevel(1)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_2 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(2)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(2)
      , EL   => OPEN
      , EO   => ro_rlevel(2)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_3 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(3)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(3)
      , EL   => OPEN
      , EO   => ro_rlevel(3)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_4 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(4)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(4)
      , EL   => OPEN
      , EO   => ro_rlevel(4)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_5 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(5)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(5)
      , EL   => OPEN
      , EO   => ro_rlevel(5)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_6 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(6)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(6)
      , EL   => OPEN
      , EO   => ro_rlevel(6)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_7 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(7)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(7)
      , EL   => OPEN
      , EO   => ro_rlevel(7)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_8 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(8)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(8)
      , EL   => OPEN
      , EO   => ro_rlevel(8)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_9 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(9)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(9)
      , EL   => OPEN
      , EO   => ro_rlevel(9)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_rlevel_10 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_rlevel(10)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => rlevel_i(10)
      , EL   => OPEN
      , EO   => ro_rlevel(10)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wclk : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wclk
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_wclk
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wclk_en_n : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wclk_en_n
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_wclk_en_n
      , RL   => OPEN
      , RO   => r_wclk_en_n
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wclk_rst : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wclk_rst
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_wclk_rst
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_whf : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_whf
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => r_whf
      , EL   => OPEN
      , EO   => ro_whf
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_0 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(0)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(0)
      , EL   => OPEN
      , EO   => ro_wlevel(0)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_1 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(1)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(1)
      , EL   => OPEN
      , EO   => ro_wlevel(1)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_2 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(2)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(2)
      , EL   => OPEN
      , EO   => ro_wlevel(2)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_3 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(3)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(3)
      , EL   => OPEN
      , EO   => ro_wlevel(3)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_4 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(4)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(4)
      , EL   => OPEN
      , EO   => ro_wlevel(4)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_5 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(5)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(5)
      , EL   => OPEN
      , EO   => ro_wlevel(5)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_6 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(6)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(6)
      , EL   => OPEN
      , EO   => ro_wlevel(6)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_7 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(7)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(7)
      , EL   => OPEN
      , EO   => ro_wlevel(7)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_8 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(8)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(8)
      , EL   => OPEN
      , EO   => ro_wlevel(8)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_9 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(9)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_i(9)
      , EL   => OPEN
      , EO   => ro_wlevel(9)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wlevel_10 : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0010"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0000"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0001"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wlevel(10)
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => wlevel_sig(10)
      , EL   => OPEN
      , EO   => ro_wlevel(10)
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => OPEN
      , RL   => OPEN
      , RO   => OPEN
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

  i_sdrv_wr : NX_IOD
    generic map (
        epath_edge => '0'
      , epath_init => '0'
      , epath_load => '0'
      , epath_mode => b"0000"
      , epath_sync => '0'
      , rpath_edge => '0'
      , rpath_init => '0'
      , rpath_load => '0'
      , rpath_mode => b"0010"
      , rpath_sync => '0'
      , cpath_edge => '0'
      , cpath_init => '0'
      , cpath_load => '0'
      , cpath_mode => b"0000"
      , cpath_sync => '0'
      , cpath_inv  => '0'
      , tpath_mode => b"00"
      , chained    => '0'
    )
    port map (
        CCK  => OPEN
      , CI   => OPEN
      , CL   => OPEN
      , CO   => rt_wr
      , CR   => OPEN
      , CT   => OPEN
      , CXI1 => OPEN
      , CXI2 => OPEN
      , CXI3 => OPEN
      , CXI4 => OPEN
      , ECK  => OPEN
      , EI   => OPEN
      , EL   => OPEN
      , EO   => OPEN
      , ER   => OPEN
      , EXI1 => OPEN
      , EXI2 => OPEN
      , EXI3 => OPEN
      , EXI4 => OPEN
      , LINK => OPEN
      , RCK  => OPEN
      , RI   => ri_wr
      , RL   => OPEN
      , RO   => r_wr
      , RR   => OPEN
      , RXO1 => OPEN
      , RXO2 => OPEN
      , RXO3 => OPEN
      , RXO4 => OPEN
    );

end;

