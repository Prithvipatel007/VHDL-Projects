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

vcom -work work -explicit -2008 ../src/tx/c02ec_e.vhd
vcom -work work -explicit -2008 ../src/tx/c02ec_a.vhd
vcom -work work -explicit -2008 ../src/tx/c05ec_e.vhd
vcom -work work -explicit -2008 ../src/tx/c05ec_a.vhd
vcom -work work -explicit -2008 ../src/tx/c10ec_e.vhd
vcom -work work -explicit -2008 ../src/tx/c10ec_a.vhd
vcom -work work -explicit -2008 ../src/tx/c12ec_e.vhd
vcom -work work -explicit -2008 ../src/tx/c12ec_a.vhd
vcom -work work -explicit -2008 ../src/tx/signal_generator_e.vhd
vcom -work work -explicit -2008 ../src/tx/signal_generator_a.vhd
vcom -work work -explicit -2008 ../src/tx/baud_e.vhd
vcom -work work -explicit -2008 ../src/tx/baud_a.vhd
vcom -work work -explicit -2008 ../src/tx/morse_ascii_e.vhd
vcom -work work -explicit -2008 ../src/tx/morse_ascii_a.vhd
vcom -work work -explicit -2008 ../src/tx/transmission_e.vhd
vcom -work work -explicit -2008 ../src/tx/transmission_a.vhd
vcom -work work -explicit -2008 ../src/tx/top_level_tx_e.vhd
vcom -work work -explicit -2008 ../src/tx/top_level_tx_a.vhd

# files for Morse Code Reception



# Testbenches for Morse Code Transmission

vcom -work work -explicit -2008 ../tb/tx/tb_top_level_tx_e.vhd
vcom -work work -explicit -2008 ../tb/tx/tb_top_level_tx_a.vhd


# Testbenches for Morse Code Reception



#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_top_level_tx_e
  
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

run 10000 ms
