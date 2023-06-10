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

vcom -work work ../src/reset_generator.vhd
vcom -work work ../tb/tb_reset_generator.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.tb_reset_generator
#
echo "add wave"
radix -hexadecimal
#radix -binary
view wave
#
add wave -r /*
#
echo "testbench run all"
run 10000 ns
