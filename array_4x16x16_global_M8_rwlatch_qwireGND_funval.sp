 * include model and subckts
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' mc
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' mc_hvt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' mc_lvt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' stat

 .TEMP 25
*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear
 .option runlvl=5
 .option mcbrief=1
* .option probe=1

*define parameters
 .param supply0=0.35
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

 .include 'mem_top_M8.midbuf.init.sp'
 .include 'mem_top_M8_rwlatch_qwireGND_nopex.cdl'

 xmem_pipeline clk wen A5 A4 A3 A2 A1 A0 D15 D14 D13 
+ D12 D11 D10 D9 D8 D7 D6 D5 D4 D3 D2 D1 D0 Q15 
+ Q14 Q13 Q12 Q11 Q10 Q9 Q8 Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 mem_pipeline

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
 vd0 d0 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd1 d1 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd2 d2 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd3 d3 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd4 d4 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd5 d5 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd6 d6 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd7 d7 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd8 d8 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd9 d9 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd10 d10 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd11 d11 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd12 d12 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd13 d13 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd14 d14 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 vd15 d15 0 pulse(0 'supply0' 15n 'slew' 'slew' 20n 40n)
 va0 a0 0 pulse(0 'supply0' 55n 'slew' 'slew' 60n 120n)
 va1 a1 0 pulse(0 'supply0' 115n 'slew' 'slew' 120n 240n)
 va2 a2 0 pulse(0 'supply0' 235n 'slew' 'slew' 240n 480n)
 va3 a3 0 pulse(0 'supply0' 475n 'slew' 'slew' 480n 960n)
 va4 a4 0 pulse(0 'supply0' 955n 'slew' 'slew' 960n 1920n)
 va5 a5 0 pulse(0 'supply0' 1915n 'slew' 'slew' 1920n 3840n)

 vclk clk 0 pulse(0 'supply0' 10n 'slew' 'slew' 10n 20n)
 vwen wen 0 pulse('supply0' 0 15n 'slew' 'slew' 20n 60n)

.param st=8000n
.TRAN 3.5P 'st'

.option MCBRIEF=1
.measure TRAN write1 AVG v(xmem_pipeline.xmem_top.Xarray_0.XI797.Q) FROM=79ns TO=81ns
.measure TRAN read1 AVG v(xmem_pipeline.q_wire[0]) FROM=98ns TO=100ns
.measure TRAN delay_write1
+	TRIG v(xmem_pipeline.xmem_top.wwlb_wire[0]) VAL='supply0/2' RISE=1 td=40n
+	TARG v(xmem_pipeline.xmem_top.Xarray_0.XI797.Q) VAL='supply0/2' RISE=1
.measure TRAN delay_read1
+	TRIG v(xmem_pipeline.Xmem_top.rwl_latch[0]) VAL='supply0/2' RISE=1 td=40n
+	TARG v(xmem_pipeline.q_wire[0]) VAL='supply0/2' RISE=1
.end
