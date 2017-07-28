 * include model and subckts
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_lvt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_hvt

 .TEMP 25
*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear
*.option probe=1
 .option MCBRIEF=1

*define parameters
 .param finger=4
 .param supply0=0.35
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

  .include 'mem_top.init.sp'
 .include 'sram4x16_mac.sp'

 xsram clk wen a1 a0 
 + d15 d14 d13 d12 d11 d10 d9 d8 d7 d6 d5 d4 d3 d2 d1 d0 
 + q15 q14 q13 q12 q11 q10 q9 q8 q7 q6 q5 q4 q3 q2 q1 q0 
 + vdd vss sram

 vvdd vdd 0 dc 'supply0'
 vvss vss 0 dc 0
 cvdd vdd 0 'load'
 cvss vss 0 'load'
 ccap_q0 q0 0 'load'
 ccap_q1 q1 0 'load'
 ccap_q2 q2 0 'load'
 ccap_q3 q3 0 'load'
 ccap_q4 q4 0 'load'
 ccap_q5 q5 0 'load'
 ccap_q6 q6 0 'load'
 ccap_q7 q7 0 'load'
 ccap_q8 q8 0 'load'
 ccap_q9 q9 0 'load'
 ccap_q10 q10 0 'load'
 ccap_q11 q11 0 'load'
 ccap_q12 q12 0 'load'
 ccap_q13 q13 0 'load'
 ccap_q14 q14 0 'load'
 ccap_q15 q15 0 'load'
 *bitline0 write 1
 vd0 d0 0 dc 'supply0'
 *bitline1 write 0
 vd1 d1 0 dc 0 
 *bitline2 write 1
 vd2 d2 0 dc 'supply0'
 *bitline3 write 0
 vd3 d3 0 dc 0
 *bitline4 write 1
 vd4 d4 0 dc 'supply0'
 *bitline5 write 0
 vd5 d5 0 dc 0
 vd6 d6 0 dc 'supply0'
 vd7 d7 0 dc 'supply0'
 vd8 d8 0 dc 'supply0'
 vd9 d9 0 dc 'supply0'
 vd10 d10 0 dc 'supply0'
 vd11 d11 0 dc 'supply0'
 vd12 d12 0 dc 'supply0'
 vd13 d13 0 dc 'supply0'
 vd14 d14 0 dc 'supply0'
 vd15 d15 0 dc 'supply0'
 va0 a0 0 dc 0
 va1 a1 0 dc 0

 vclk clk 0 pulse(0 'supply0' 10n 'slew' 'slew' 10n 20n)
 vwen wen 0 pulse('supply0' 0 15n 'slew' 'slew' 20n 40n)

* vwen wen 0 pwl
* + 0 'supply0'
* + 20n 'supply0'
* + '20n + slew*supply0' 0
* + 40n 0
* + '40n + slew*supply0' 'supply0'

.param st=100n
.TRAN 3.5P 'st' SWEEP Monte=3 

*measure write 0/1
.measure tran delay_write1_worst trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.Xmem_top.Xarray0.XI4.Q) val='supply0/2' rise=1 td=45n
.measure tran delay_write0_worst trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.Xmem_top.Xarray0.XI12.Q) val='supply0/2' fall=1 td=45n
.measure tran delay_write1_best trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.Xmem_top.Xarray0.XI33.Q) val='supply0/2' rise=1 td=45n
.measure tran delay_write0_best trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.Xmem_top.Xarray0.XI34.Q) val='supply0/2' fall=1 td=45n
*measure read 0/1
.measure tran delay_read1_worst trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.q_wire2) val='supply0/2' rise=1 td=45n
.measure tran delay_read0_worst trig v(clk) val='supply0/2' rise=1 td=45n targ v(xsram.q_wire3) val='supply0/2' fall=1 td=45n
*.measure tran delay_read1_best trig v(clk) val='supply02' rise=1 td=45n targ v(xsram.q_wire6) val='supply02' fall=1 td=45n
*.measure tran delay_read0_best trig v(clk) val='supply02' rise=1 td=45n targ v(xsram.q_wire7) val='supply02' fall=1 td=45n
.end
