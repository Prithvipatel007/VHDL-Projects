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


# files for Morse Code Transmission
vcom -work work -explicit -2008 ../src/mc_transmission/clock_divider_e.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/clock_divider_a.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/morse_decoder_e.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/morse_decoder_a.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/uart_tx_e.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/uart_tx_a.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/top_level_transmission_e.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/top_level_transmission_a.vhd


# files for Morse Code Reception



# Testbenches for Morse Code Transmission

vcom -work work -explicit -2008 ../tb/mc_transmission/tb_top_level_transmission_e.vhd
vcom -work work -explicit -2008 ../tb/mc_transmission/tb_top_level_transmission_a.vhd

# Testbenches for Morse Code Reception



#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_top_level_transmission_e
  
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

do ../scripts/addwave.do

run 20000 ms

