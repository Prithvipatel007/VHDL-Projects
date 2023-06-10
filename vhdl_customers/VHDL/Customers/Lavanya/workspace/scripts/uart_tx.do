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
vcom -work work -explicit -2008 ../src/mc_transmission/uart_tx_e.vhd
vcom -work work -explicit -2008 ../src/mc_transmission/uart_tx_a.vhd

# files for Morse Code Reception



# Testbenches for Morse Code Transmission

vcom -work work -explicit -2008 ../tb/mc_transmission/tb_uart_tx_e.vhd
vcom -work work -explicit -2008 ../tb/mc_transmission/tb_uart_tx_a.vhd

# Testbenches for Morse Code Reception



#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

vsim -voptargs=+acc -t 1ns work.tb_uart_tx_e
  
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

run 100 ms

