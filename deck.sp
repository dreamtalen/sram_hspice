 * include model and subckts
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_hvt
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt_lvt

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
 .param supply0=0.35
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

 .include 'mem_pipeline.init.sp'
 * .include 'mem_top.sp'
 * .include 'mem_top_mac.sp'
 .include 'mem_pipeline.cdl'

 xmem_pipeline clk wen A[5] A[4] A[3] A[2] A[1] A[0] D[15] D[14] D[13] 
+ D[12] D[11] D[10] D[9] D[8] D[7] D[6] D[5] D[4] D[3] D[2] D[1] D[0] Q[15] 
+ Q[14] Q[13] Q[12] Q[11] Q[10] Q[9] Q[8] Q[7] Q[6] Q[5] Q[4] Q[3] Q[2] Q[1] Q[0] mem_pipeline

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
 vd0 d0 0 dc 'supply0'
 vd1 d1 0 dc 'supply0'
 vd2 d2 0 dc 'supply0'
 vd3 d3 0 dc 'supply0'
 vd4 d4 0 dc 'supply0'
 vd5 d5 0 dc 'supply0'
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
 va2 a2 0 dc 0
 va3 a3 0 dc 0
 va4 a4 0 dc 0
 va5 a5 0 dc 0

 vclk clk 0 pulse(0 'supply0' 10n 'slew' 'slew' 10n 20n)
 vwen wen 0 pulse('supply0' 0 15n 'slew' 'slew' 20n 40n)

.param st=100n
.TRAN 3.5P 'st' SWEEP MONTE=1
.option MCBRIEF=1
.end
