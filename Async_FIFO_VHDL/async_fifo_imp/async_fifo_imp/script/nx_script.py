## -- Script for executing the .vhd files inside src folders
##  The Directory structure is divided into different folders
##
## sim - it consists of the work directory for simulation in modelsim or questasim
## src - it consists of the src files of the project .vhd files
## tb  - it consists of the testbenches for the project

#####------------------------------Import the libraries-------------######
import os
import sys

from nanoxmap import *;

#####-------------------------------Set Varibles---------------------#####
dir = os.path.dirname(os.path.realpath(__file__))
sys.path.append(dir)

#####-------------------------------Creating Project-----------------#####

project = createProject()

#####-------------------------------Configurations-------------------#####
project.setVariantName('NG-LARGE')
project.setDirectory(dir)
project.setTopCellName('async_fifo')
project.addFiles([
	'../src/twoport_ram.vhd',
	'../src/async_fifo.vhd'
])
project.setOptions({
	'UseNxLibrary'					:	'Yes',
	'ManageUnconnectedOutputs'		:	'Ground',
	'ManageUnconnectedSignals'		:	'Ground',
	'TimingDriven'					:	'Yes',
	'MappingEffort'					:	'High'
})

#project.addMappingDirective('getModels(.*ram.*)', 'RAM', 'RAM')		#for RAM blocks
project.addMappingDirective('getModels(.*ram.*)', 'RAM', 'RAM_ECC')			# for RF blocks

project.createClock('getPort(rclk)','clk',10000)
project.createClock('getPort(wclk)','clk',10000)

project.save(dir + '../NX_generated_files/native.nxm')

if not project.synthesize():
	sys.exit(1)

project.reportInstances()

project.save(dir + '../NX_generated_files/synthesize.vhd')
project.save(dir + '../NX_generated_files/synthesize.nxm')

if not project.place():
	sys.exit()

project.reportInstances()
	
if not project.route():
	sys.exit(1)
	
project.reportInstances()

project.save(dir + '../NX_generated_files/routed.nxm')

printText('Design is ready to be uploaded into the NX FPGA')

##### ---------------Static Timing Analyzer--------------#####

analyzer = project.createAnalyzer()
analyzer.launch()

print('Error 		: ' , getErrorCount())
print('Warnings 	: ' , getWarningCount())