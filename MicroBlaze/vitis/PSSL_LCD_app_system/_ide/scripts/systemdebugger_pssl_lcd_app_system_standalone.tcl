# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\Verilog_HDL\20.02\PSSL\MicroBlaze\PSSL_LCD\vitis\PSSL_LCD_app_system\_ide\scripts\systemdebugger_pssl_lcd_app_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\Verilog_HDL\20.02\PSSL\MicroBlaze\PSSL_LCD\vitis\PSSL_LCD_app_system\_ide\scripts\systemdebugger_pssl_lcd_app_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183B30A7AA" && level==0 && jtag_device_ctx=="jsn-Basys3-210183B30A7AA-0362d093-0"}
fpga -file D:/Verilog_HDL/20.02/PSSL/MicroBlaze/PSSL_LCD/vitis/PSSL_LCD_app/_ide/bitstream/PSSL_design_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/Verilog_HDL/20.02/PSSL/MicroBlaze/PSSL_LCD/vitis/PSSL_design_wrapper/export/PSSL_design_wrapper/hw/PSSL_design_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/Verilog_HDL/20.02/PSSL/MicroBlaze/PSSL_LCD/vitis/PSSL_LCD_app/Debug/PSSL_LCD_app.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
