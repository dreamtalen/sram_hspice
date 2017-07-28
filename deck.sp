 * include model and subckts
 .lib '/home/wjin/TSMC_65/hspice_model/crn65gplus_2d5_lk_v1d0.l' tt
 .lib '/home/wjin/TSMC_65/hspice_model/crn65gplus_2d5_lk_v1d0.l' tt_hvt
 .lib '/home/wjin/TSMC_65/hspice_model/crn65gplus_2d5_lk_v1d0.l' tt_lvt

 .TEMP 25
*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear
 .option runlvl=5
 .option probe=1

*define parameters
 .param supply0=0.35
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

 .include 'mem_top.init.sp'
 * .include 'mem_top.sp'
 .include 'mem_top_mac.sp'

 xmem wen a4 a3 a2 a1 a0 
 + d15 d14 d13 d12 d11 d10 d9 d8 d7 d6 d5 d4 d3 d2 d1 d0 
 + q15 q14 q13 q12 q11 q10 q9 q8 q7 q6 q5 q4 q3 q2 q1 q0 
 + vdd vss mem_top

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
 vwen wen 0 pwl
 + 0 'supply0'
 + 50n 'supply0'
 + '50n + slew*supply0' 0
 + 100n 0
 + '100n + slew*supply0' 'supply0'


* .PROBE TRAN v(wen)
* .PROBE TRAN V(q0)
* .TRAN 3.5P 300n
.param st=300n
.TRAN 3.5P 'st' SWEEP MONTE=300
.option MCBRIEF=1
.measure tran delay__wen__lh__q__lh trig v(wen) val=0.175 rise=1 targ v(q0) val=0.175 rise=1 td=100n
.measure tran max_q max v(q0) from=100n to='st'
.end
