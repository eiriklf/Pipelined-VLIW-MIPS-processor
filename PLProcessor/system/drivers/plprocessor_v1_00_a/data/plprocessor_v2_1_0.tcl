##############################################################################
## Filename:          C:\Users\torbjlan\dmkonsttdt4255_work\PLProcessor\system/drivers/plprocessor_v1_00_a/data/plprocessor_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Mon Nov 11 22:23:30 2013 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "plprocessor" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
