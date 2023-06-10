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
vcom -work work -explicit -2008 ../src/mc_reception/clock_divider_e.vhd
vcom -work work -explicit -2008 ../src/mc_reception/clock_divider_a.vhd
vcom -work work -explicit -2008 ../src/mc_reception/fifo_e.vhd
vcom -work work -explicit -2008 ../src/mc_reception/fifo_a.vhd
vcom -work work -explicit -2008 ../src/mc_reception/morse_encoder_e.vhd
vcom -work work -explicit -2008 ../src/mc_reception/morse_encoder_a.vhd
vcom -work work -explicit -2008 ../src/mc_reception/uart_receiver_e.vhd
vcom -work work -explicit -2008 ../src/mc_reception/uart_receiver_a.vhd
vcom -work work -explicit -2008 ../src/mc_reception/top_level_reception_e.vhd
vcom -work work -explicit -2008 ../src/mc_reception/top_level_reception_a.vhd


# files for Morse Code Reception



# Testbenches for Morse Code Transmission

vcom -work work -explicit -2008 ../tb/mc_reception/tb_top_level_reception_e.vhd
vcom -work work -explicit -2008 ../tb/mc_reception/tb_top_level_reception_a.vhd

# Testbenches for Morse Code Reception



#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_top_level_reception_e
  
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

