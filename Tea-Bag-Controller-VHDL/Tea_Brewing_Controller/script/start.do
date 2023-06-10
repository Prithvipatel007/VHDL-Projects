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

vcom -work work -explicit -2008 ../src/brd_generator_e.vhd
vcom -work work -explicit -2008 ../src/brd_generator_a.vhd
vcom -work work -explicit -2008 ../src/debouncer_e.vhd
vcom -work work -explicit -2008 ../src/debouncer_a.vhd
vcom -work work -explicit -2008 ../src/c02ec_e1.vhd
vcom -work work -explicit -2008 ../src/c02ec_a1.vhd
vcom -work work -explicit -2008 ../src/c05ec_e1.vhd
vcom -work work -explicit -2008 ../src/c05ec_a1.vhd
vcom -work work -explicit -2008 ../src/c10ec_e1.vhd
vcom -work work -explicit -2008 ../src/c10ec_a1.vhd
vcom -work work -explicit -2008 ../src/c13ec_e1.vhd
vcom -work work -explicit -2008 ../src/c13ec_a1.vhd
vcom -work work -explicit -2008 ../src/c16ec_e1.vhd
vcom -work work -explicit -2008 ../src/c16ec_a1.vhd
vcom -work work -explicit -2008 ../src/Cnt3_e.vhd
vcom -work work -explicit -2008 ../src/Cnt3_a.vhd
vcom -work work -explicit -2008 ../src/Cnt4_e.vhd
vcom -work work -explicit -2008 ../src/Cnt4_a.vhd
vcom -work work -explicit -2008 ../src/en_comp_e.vhd
vcom -work work -explicit -2008 ../src/en_comp_a.vhd
vcom -work work -explicit -2008 ../src/mux4x8_e.vhd
vcom -work work -explicit -2008 ../src/mux4x8_a.vhd
vcom -work work -explicit -2008 ../src/mux16_txd_e.vhd
vcom -work work -explicit -2008 ../src/mux16_txd_a.vhd
vcom -work work -explicit -2008 ../src/transmission_e.vhd
vcom -work work -explicit -2008 ../src/transmission_a.vhd
vcom -work work -explicit -2008 ../src/uart_e.vhd
vcom -work work -explicit -2008 ../src/uart_a.vhd
vcom -work work -explicit -2008 ../src/top_level_e.vhd
vcom -work work -explicit -2008 ../src/top_level_a.vhd
vcom -work work -explicit -2008 ../tb/TB_brd_gen_e.vhd
vcom -work work -explicit -2008 ../tb/TB_brd_gen_a.vhd

vcom -work work -explicit -2008 ../src/counter_60_e.vhd
vcom -work work -explicit -2008 ../src/counter_60_a.vhd
vcom -work work -explicit -2008 ../src/counter_24_e.vhd
vcom -work work -explicit -2008 ../src/counter_24_a.vhd

vcom -work work -explicit -2008 ../src/track_timer_e.vhd
vcom -work work -explicit -2008 ../src/track_timer_a.vhd
vcom -work work -explicit -2008 ../tb/tb_track_timer_e.vhd
vcom -work work -explicit -2008 ../tb/tb_track_timer_a.vhd
vcom -work work -explicit -2008 ../tb/tb_tsc_e.vhd
vcom -work work -explicit -2008 ../tb/tb_tsc_a.vhd
vcom -work work -explicit -2008 ../src/ata_e.vhd
vcom -work work -explicit -2008 ../src/ata_a.vhd
vcom -work work -explicit -2008 ../src/toa_ascii_e.vhd
vcom -work work -explicit -2008 ../src/toa_ascii_a.vhd
vcom -work work -explicit -2008 ../src/transmission_e.vhd
vcom -work work -explicit -2008 ../src/transmission_a.vhd
vcom -work work -explicit -2008 ../src/tsc_e.vhd
vcom -work work -explicit -2008 ../src/tsc_a.vhd
vcom -work work -explicit -2008 ../tb/tb_top_level_e.vhd
vcom -work work -explicit -2008 ../tb/tb_top_level_a.vhd

vcom -work work -explicit -2008 ../tb/tb_ata_e.vhd
vcom -work work -explicit -2008 ../tb/tb_ata_a.vhd

vcom -work work -explicit -2008 ../tb/tb_transmission_e.vhd
vcom -work work -explicit -2008 ../tb/tb_transmission_a.vhd

#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_top_level_e
  
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

