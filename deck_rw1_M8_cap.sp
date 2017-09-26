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
 .option measdgt=6
 .option numdgt=6
 * .option captab
* .option probe=1

*define parameters
 .param supply0=0.35
 .param SD=1n
 .param slew=3.44e-10
 .param load=5.9e-16

 .include 'mem_pipeline.init.sp'
 * .include 'mem_top.sp'
 * .include 'mem_top_mac.sp'
 .include 'mem_pipeline_M8.cdl'

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
 vd0 d0 0 dc 'supply0'
 vd1 d1 0 dc 0
 vd2 d2 0 dc 0
 vd3 d3 0 dc 0
 vd4 d4 0 dc 0
 vd5 d5 0 dc 0
 vd6 d6 0 dc 0
 vd7 d7 0 dc 0
 vd8 d8 0 dc 0
 vd9 d9 0 dc 0
 vd10 d10 0 dc 0
 vd11 d11 0 dc 0
 vd12 d12 0 dc 0
 vd13 d13 0 dc 0
 vd14 d14 0 dc 0
 vd15 d15 0 dc 0
 va0 a0 0 dc 0
 va1 a1 0 dc 0
 va2 a2 0 dc 0
 va3 a3 0 dc 0
 va4 a4 0 dc 0
 va5 a5 0 dc 0

 vclk clk 0 pulse(0 'supply0' 10n 'slew' 'slew' 10n 20n)
 vwen wen 0 pulse('supply0' 0 15n 'slew' 'slew' 20n 40n)

.param st=80n
.TRAN 3.5P 'st'
* .TRAN 3.5P 'st' SWEEP MONTE=100
.meas tran cp_wwl[31] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[31])'
.meas tran cp_wwl[30] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[30])'
.meas tran cp_wwl[29] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[29])'
.meas tran cp_wwl[28] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[28])'
.meas tran cp_wwl[27] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[27])'
.meas tran cp_wwl[26] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[26])'
.meas tran cp_wwl[25] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[25])'
.meas tran cp_wwl[24] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[24])'
.meas tran cp_wwl[23] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[23])'
.meas tran cp_wwl[22] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[22])'
.meas tran cp_wwl[21] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[21])'
.meas tran cp_wwl[20] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[20])'
.meas tran cp_wwl[19] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[19])'
.meas tran cp_wwl[18] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[18])'
.meas tran cp_wwl[17] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[17])'
.meas tran cp_wwl[16] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[16])'
.meas tran cp_wwl[15] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[15])'
.meas tran cp_wwl[14] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[14])'
.meas tran cp_wwl[13] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[13])'
.meas tran cp_wwl[12] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[12])'
.meas tran cp_wwl[11] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[11])'
.meas tran cp_wwl[10] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[10])'
.meas tran cp_wwl[9] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[9])'
.meas tran cp_wwl[8] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[8])'
.meas tran cp_wwl[7] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[7])'
.meas tran cp_wwl[6] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[6])'
.meas tran cp_wwl[5] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[5])'
.meas tran cp_wwl[4] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[4])'
.meas tran cp_wwl[3] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[3])'
.meas tran cp_wwl[2] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[2])'
.meas tran cp_wwl[1] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[1])'
.meas tran cp_wwl[0] param='cap(xmem_pipeline.xmem_top.xarray_0.wwl[0])'
.meas tran cp_rwl[31] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[31])'
.meas tran cp_rwl[30] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[30])'
.meas tran cp_rwl[29] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[29])'
.meas tran cp_rwl[28] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[28])'
.meas tran cp_rwl[27] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[27])'
.meas tran cp_rwl[26] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[26])'
.meas tran cp_rwl[25] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[25])'
.meas tran cp_rwl[24] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[24])'
.meas tran cp_rwl[23] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[23])'
.meas tran cp_rwl[22] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[22])'
.meas tran cp_rwl[21] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[21])'
.meas tran cp_rwl[20] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[20])'
.meas tran cp_rwl[19] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[19])'
.meas tran cp_rwl[18] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[18])'
.meas tran cp_rwl[17] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[17])'
.meas tran cp_rwl[16] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[16])'
.meas tran cp_rwl[15] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[15])'
.meas tran cp_rwl[14] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[14])'
.meas tran cp_rwl[13] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[13])'
.meas tran cp_rwl[12] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[12])'
.meas tran cp_rwl[11] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[11])'
.meas tran cp_rwl[10] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[10])'
.meas tran cp_rwl[9] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[9])'
.meas tran cp_rwl[8] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[8])'
.meas tran cp_rwl[7] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[7])'
.meas tran cp_rwl[6] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[6])'
.meas tran cp_rwl[5] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[5])'
.meas tran cp_rwl[4] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[4])'
.meas tran cp_rwl[3] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[3])'
.meas tran cp_rwl[2] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[2])'
.meas tran cp_rwl[1] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[1])'
.meas tran cp_rwl[0] param='cap(xmem_pipeline.xmem_top.xarray_0.rwl[0])'
.meas tran cp_rwlb[31] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[31])'
.meas tran cp_rwlb[30] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[30])'
.meas tran cp_rwlb[29] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[29])'
.meas tran cp_rwlb[28] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[28])'
.meas tran cp_rwlb[27] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[27])'
.meas tran cp_rwlb[26] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[26])'
.meas tran cp_rwlb[25] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[25])'
.meas tran cp_rwlb[24] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[24])'
.meas tran cp_rwlb[23] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[23])'
.meas tran cp_rwlb[22] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[22])'
.meas tran cp_rwlb[21] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[21])'
.meas tran cp_rwlb[20] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[20])'
.meas tran cp_rwlb[19] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[19])'
.meas tran cp_rwlb[18] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[18])'
.meas tran cp_rwlb[17] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[17])'
.meas tran cp_rwlb[16] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[16])'
.meas tran cp_rwlb[15] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[15])'
.meas tran cp_rwlb[14] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[14])'
.meas tran cp_rwlb[13] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[13])'
.meas tran cp_rwlb[12] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[12])'
.meas tran cp_rwlb[11] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[11])'
.meas tran cp_rwlb[10] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[10])'
.meas tran cp_rwlb[9] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[9])'
.meas tran cp_rwlb[8] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[8])'
.meas tran cp_rwlb[7] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[7])'
.meas tran cp_rwlb[6] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[6])'
.meas tran cp_rwlb[5] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[5])'
.meas tran cp_rwlb[4] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[4])'
.meas tran cp_rwlb[3] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[3])'
.meas tran cp_rwlb[2] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[2])'
.meas tran cp_rwlb[1] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[1])'
.meas tran cp_rwlb[0] param='cap(xmem_pipeline.xmem_top.xarray_0.rwlb[0])'
.meas tran cp_wbl[15] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[15])'
.meas tran cp_wbl[14] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[14])'
.meas tran cp_wbl[13] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[13])'
.meas tran cp_wbl[12] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[12])'
.meas tran cp_wbl[11] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[11])'
.meas tran cp_wbl[10] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[10])'
.meas tran cp_wbl[9] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[9])'
.meas tran cp_wbl[8] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[8])'
.meas tran cp_wbl[7] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[7])'
.meas tran cp_wbl[6] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[6])'
.meas tran cp_wbl[5] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[5])'
.meas tran cp_wbl[4] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[4])'
.meas tran cp_wbl[3] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[3])'
.meas tran cp_wbl[2] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[2])'
.meas tran cp_wbl[1] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[1])'
.meas tran cp_wbl[0] param='cap(xmem_pipeline.xmem_top.xarray_0.wbl[0])'
.meas tran cp_wblb[15] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[15])'
.meas tran cp_wblb[14] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[14])'
.meas tran cp_wblb[13] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[13])'
.meas tran cp_wblb[12] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[12])'
.meas tran cp_wblb[11] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[11])'
.meas tran cp_wblb[10] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[10])'
.meas tran cp_wblb[9] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[9])'
.meas tran cp_wblb[8] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[8])'
.meas tran cp_wblb[7] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[7])'
.meas tran cp_wblb[6] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[6])'
.meas tran cp_wblb[5] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[5])'
.meas tran cp_wblb[4] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[4])'
.meas tran cp_wblb[3] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[3])'
.meas tran cp_wblb[2] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[2])'
.meas tran cp_wblb[1] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[1])'
.meas tran cp_wblb[0] param='cap(xmem_pipeline.xmem_top.xarray_0.wblb[0])'
.meas tran cp_rbl[15] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[15])'
.meas tran cp_rbl[14] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[14])'
.meas tran cp_rbl[13] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[13])'
.meas tran cp_rbl[12] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[12])'
.meas tran cp_rbl[11] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[11])'
.meas tran cp_rbl[10] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[10])'
.meas tran cp_rbl[9] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[9])'
.meas tran cp_rbl[8] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[8])'
.meas tran cp_rbl[7] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[7])'
.meas tran cp_rbl[6] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[6])'
.meas tran cp_rbl[5] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[5])'
.meas tran cp_rbl[4] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[4])'
.meas tran cp_rbl[3] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[3])'
.meas tran cp_rbl[2] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[2])'
.meas tran cp_rbl[1] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[1])'
.meas tran cp_rbl[0] param='cap(xmem_pipeline.xmem_top.xarray_0.rbl[0])'
.measure TRAN delay_write1
+	TRIG v(xmem_pipeline.Xmem_top.wwl_wire[0]) VAL='supply0/2' RISE=1
+	TARG v(xmem_pipeline.Xmem_top.Xarray_0.Xword_0__w.XU.Q) VAL='supply0/2' RISE=1

.measure TRAN delay_read1
+	TRIG v(xmem_pipeline.Xmem_top.rwl[0]) VAL='supply0/2' RISE=2
+	TARG v(xmem_pipeline.q_wire[0]) VAL='supply0/2' RISE=1
.option MCBRIEF=1
.end
