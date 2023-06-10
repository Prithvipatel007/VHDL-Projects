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

vcom -work work ../src/debouncer.vhd
vcom -work work ../tb/tb_debouncer.vhd

#-------------------------------------------------------------------------------
#

echo "simulation"

vsim -voptargs=+acc -t 1ns work.tb_debouncer
#
echo "add wave"
radix -hexadecimal
#radix -binary
view wave
#
add wave -r /*
#
echo "testbench run all"
run 100 ms
