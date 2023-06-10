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


vcom -work work ../src/adder.vhd

vcom -work work ../tb/adder_tb.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.adder_clk_tb
#
echo "add wave"
radix -hexadecimal
#radix -binary
view wave
#
add wave -r /*
#
echo "testbench run all"
run -all
