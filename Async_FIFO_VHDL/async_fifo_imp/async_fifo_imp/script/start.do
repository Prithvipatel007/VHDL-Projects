echo "start.do started!"
quit -sim

#-------------------------------------------------------------------------------
#  VLIB
#-------------------------------------------------------------------------------

# ---- vlib work --------------------------------------------------------------------------------------
if {[file isdirectory work]} {
	echo "Library NX already exists !!!"	
} else {	
	vlib nx
	vcom -work nx -explicit -93 "/products_nfs/nanoxplore/NXmap/2.9.2/share/modelsim/nxLibrary.vhdp"
}

if {[file isdirectory work]} {
	echo "Library work already exists !!!"	
} else {	
	vlib work
}

#-------------------------------------------------------------------------------
#  VCOM
#-------------------------------------------------------------------------------
echo "Compile Toplevel..."

vcom -work work -explicit -2008 ../src/twoport_ram.vhd
vcom -work work -explicit -2008 ../src/async_fifo.vhd
vcom -work work -explicit -2008 ../tb/tb_async_fifo.vhd
vcom -work work -explicit -2008 ../tb/tb_async_fifo_complex.vhd


#-------------------------------------------------------------------------------
# Simulate!
#-------------------------------------------------------------------------------

echo "Simulate..."

#vsim -voptargs=+acc -t 1ns work.tb_std_fifo
#vsim -voptargs=+acc -t 1ps work.tb_async_fifo_complex
vsim -voptargs=+acc -t 1ps work.tb_async_fifo
#vsim -novopt work.tb_multiplier_loop_tst  #for no optimization
  
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

run 2 ms

