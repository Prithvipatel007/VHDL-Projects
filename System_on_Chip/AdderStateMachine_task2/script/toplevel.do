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
vcom -work work ../src/debouncer.vhd
vcom -work work ../src/Clock_02.vhd
vcom -work work ../src/Clock_5.vhd
vcom -work work ../src/Clock_10.vhd
vcom -work work ../src/Clock_12.vhd
vcom -work work ../src/clk_generator.vhd
vcom -work work ../src/adder.vhd
vcom -work work ../src/register_input.vhd
vcom -work work ../src/toplevel.vhd

vcom -work work ../tb/tb_top_level.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.tb_top_level
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
