echo "start.do started!"
quit -sim

#-------------------------------------------------------------------------------
#  VLIB
#-------------------------------------------------------------------------------
if {[file isdirectory work]} {
	echo "Library work already exists !!!"	
} else {	
	vlib work
}

#-------------------------------------------------------------------------------
#  VCOM
#-------------------------------------------------------------------------------
echo "Compile Toplevel..."

vcom -work work -explicit -2008 ../src/baudrate_e.vhd
vcom -work work -explicit -2008 ../src/baudrate_a.vhd
vcom -work work -explicit -2008 ../src/filter_e.vhd
vcom -work work -explicit -2008 ../src/filter_a.vhd
vcom -work work -explicit -2008 ../src/c12ec_e.vhd
vcom -work work -explicit -2008 ../src/c12ec_a.vhd
vcom -work work -explicit -2008 ../src/c05ec_e.vhd
vcom -work work -explicit -2008 ../src/c05ec_a.vhd
vcom -work work -explicit -2008 ../src/c10ec_e.vhd
vcom -work work -explicit -2008 ../src/c10ec_a.vhd
vcom -work work -explicit -2008 ../src/Cnt3_e.vhd
vcom -work work -explicit -2008 ../src/Cnt3_a.vhd
vcom -work work -explicit -2008 ../src/Cnt4_e.vhd
vcom -work work -explicit -2008 ../src/Cnt4_a.vhd
vcom -work work -explicit -2008 ../src/mux4x8_e.vhd
vcom -work work -explicit -2008 ../src/mux4x8_a.vhd
vcom -work work -explicit -2008 ../src/mux16_txd_e.vhd
vcom -work work -explicit -2008 ../src/mux16_txd_a.vhd
vcom -work work -explicit -2008 ../src/txd_e.vhd
vcom -work work -explicit -2008 ../src/txd_a.vhd

vcom -work work -explicit -2008 ../tb/tb_txd_e.vhd
vcom -work work -explicit -2008 ../tb/tb_txd_a.vhd

vcom -work work -explicit -2008 ../src/uart_e.vhd
vcom -work work -explicit -2008 ../src/uart_a.vhd

vcom -work work -explicit -2008 ../tb/tb_baudrate_e.vhd
vcom -work work -explicit -2008 ../tb/tb_baudrate_a.vhd

vcom -work work -explicit -2008 ../src/c60_e.vhd
vcom -work work -explicit -2008 ../src/c60_a.vhd
vcom -work work -explicit -2008 ../src/c24_e.vhd
vcom -work work -explicit -2008 ../src/c24_a.vhd
vcom -work work -explicit -2008 ../src/tsc_ctrl_e.vhd
vcom -work work -explicit -2008 ../src/tsc_ctrl_a.vhd
vcom -work work -explicit -2008 ../src/ata_ctrl_e.vhd
vcom -work work -explicit -2008 ../src/ata_ctrl_a.vhd
vcom -work work -explicit -2008 ../src/timer_e.vhd
vcom -work work -explicit -2008 ../src/timer_a.vhd

vcom -work work -explicit -2008 ../tb/tb_timer_e.vhd
vcom -work work -explicit -2008 ../tb/tb_timer_a.vhd
vcom -work work -explicit -2008 ../tb/tb_tsc_ctrl_e.vhd
vcom -work work -explicit -2008 ../tb/tb_tsc_ctrl_a.vhd
vcom -work work -explicit -2008 ../tb/tb_ata_ctrl_e.vhd
vcom -work work -explicit -2008 ../tb/tb_ata_ctrl_a.vhd

vcom -work work -explicit -2008 ../src/ascii_conv_e.vhd
vcom -work work -explicit -2008 ../src/ascii_conv_a.vhd

vcom -work work -explicit -2008 ../src/toplevel_e.vhd
vcom -work work -explicit -2008 ../src/toplevel_a.vhd

vcom -work work -explicit -2008 ../tb/tb_toplevel_e.vhd
vcom -work work -explicit -2008 ../tb/tb_toplevel_a.vhd




#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_toplevel_e
  
echo "....simulation of FPGA started.... "  

precision 12
  
#-------------------------------------------------------------------------------
# Add WAVE!
#-------------------------------------------------------------------------------

#radix -binary
radix -hexadecimal
#radix -decimal
#radix -unsigned
view wave

do ../script/addwave.do

run 660000 ms

