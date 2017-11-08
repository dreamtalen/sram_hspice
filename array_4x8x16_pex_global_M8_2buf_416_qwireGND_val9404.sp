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

 .include 'mem_top_M8_pex_all0.init.sp'
 .include 'mem_top_M8_2buf_416_qwireGND_8x16.cdl'

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
 vd0 d0 0 dc 0
 vd1 d1 0 dc 0
 vd2 d2 0 dc 'supply0'
 vd3 d3 0 dc 0
 vd4 d4 0 dc 0
 vd5 d5 0 dc 0
 vd6 d6 0 dc 0
 vd7 d7 0 dc 0
 vd8 d8 0 dc 0
 vd9 d9 0 dc 0
 vd10 d10 0 dc 'supply0'
 vd11 d11 0 dc 0
 vd12 d12 0 dc 'supply0'
 vd13 d13 0 dc 0
 vd14 d14 0 dc 0
 vd15 d15 0 dc 'supply0'
 va0 a0 0 dc 0
 va1 a1 0 dc 0
 va2 a2 0 dc 0
 va3 a3 0 dc 0
 va4 a4 0 dc 0
 va5 a5 0 dc 0

 vclk clk 0 pulse(0 'supply0' 10n 'slew' 'slew' 10n 20n)
 vwen wen 0 pulse('supply0' 0 15n 'slew' 'slew' 20n 40n)

.param st=100n
.TRAN 3.5P 'st'
.option MCBRIEF=1
.measure TRAN delay_read1
+	TRIG v(xmem_pipeline.Xmem_top.rwl_buf[15]) VAL='supply0/2' RISE=1 td=40n
+	TARG v(xmem_pipeline.Xmem_top.q_wire_0[15]) VAL='supply0/2' RISE=1
.end
