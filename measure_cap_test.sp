 * include model and subckts
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_hvt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_lvt
.global vdd gnd vss
.INCLUDE "/home/wjin/lincx/library/spice/cmn65gp_mvt_stdcells_mac.sp" 

 .TEMP 25
*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear
 .option runlvl=5
* .option probe=1

*define parameters
 * .param supply=0.35
 .param supply=1
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

XU0 I ZN VDD VSS INVD1LVT

VDD VDD GND 'SUPPLY'
VIN A GND PULSE 0 'SUPPLY' 50ps 10ps 10ps 480ps 1ns

.param st=80n
 .TRAN 3.5P 'st'
.option MCBRIEF=1
* .meas tran cp_inv1_Z param='cap(XU0.Z)'
* .meas tran cp_inv1_I param='cap(XU0.I)'
.print tran cap(XU0.ZN) cap(XU0.I)
.end








