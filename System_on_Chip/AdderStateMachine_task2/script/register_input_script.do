echo "compilation started!"
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

vcom -work work ../src/register_input.vhd
vcom -work work ../tb/tb_register_input.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.tb_register_input
#
echo "add wave"
radix -hexadecimal
#radix -binary
view wave
#
add wave -r /*
#
echo "testbench run all"
run 1 ms
