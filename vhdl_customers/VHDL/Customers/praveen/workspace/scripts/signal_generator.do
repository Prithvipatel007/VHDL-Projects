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

vcom -work work -explicit -2008 ../src/rx/c02ec_e.vhd
vcom -work work -explicit -2008 ../src/rx/c02ec_a.vhd
vcom -work work -explicit -2008 ../src/rx/c05ec_e.vhd
vcom -work work -explicit -2008 ../src/rx/c05ec_a.vhd
vcom -work work -explicit -2008 ../src/rx/c10ec_e.vhd
vcom -work work -explicit -2008 ../src/rx/c10ec_a.vhd
vcom -work work -explicit -2008 ../src/rx/c12ec_e.vhd
vcom -work work -explicit -2008 ../src/rx/c12ec_a.vhd
vcom -work work -explicit -2008 ../src/rx/signal_generator_e.vhd
vcom -work work -explicit -2008 ../src/rx/signal_generator_a.vhd

# files for Morse Code Reception



# Testbenches for Morse Code Transmission

vcom -work work -explicit -2008 ../tb/rx/tb_signal_generator_e.vhd
vcom -work work -explicit -2008 ../tb/rx/tb_signal_generator_a.vhd


# Testbenches for Morse Code Reception



#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_signal_generator_e
  
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

run 3000 ms
