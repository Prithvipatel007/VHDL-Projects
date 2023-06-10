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

vcom -work work ../src/shift_register.vhd
vcom -work work ../tb/tb_shift_register.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.shift_register_clk_tb
#
echo "add wave"
#radix -hexadecimal
radix -binary
view wave
#
add wave -r /*
#
echo "testbench run all"
run 600 ns
