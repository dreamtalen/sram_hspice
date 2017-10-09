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

 * .include 'mem_top_small.init.sp'
 .include 'only_array_pex.cdl'

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


.param st=80n
.TRAN 3.5P 'st'
* .TRAN 3.5P 'st' SWEEP MONTE=10
.option MCBRIEF=1
.meas tran cap_wwlb_wire[15] param='cap(xmem_pipeline.xarray_0.wwlb_wire[15])'
.meas tran cap_wwlb_wire[14] param='cap(xmem_pipeline.xarray_0.wwlb_wire[14])'
.meas tran cap_wwlb_wire[13] param='cap(xmem_pipeline.xarray_0.wwlb_wire[13])'
.meas tran cap_wwlb_wire[12] param='cap(xmem_pipeline.xarray_0.wwlb_wire[12])'
.meas tran cap_wwlb_wire[11] param='cap(xmem_pipeline.xarray_0.wwlb_wire[11])'
.meas tran cap_wwlb_wire[10] param='cap(xmem_pipeline.xarray_0.wwlb_wire[10])'
.meas tran cap_wwlb_wire[9] param='cap(xmem_pipeline.xarray_0.wwlb_wire[9])'
.meas tran cap_wwlb_wire[8] param='cap(xmem_pipeline.xarray_0.wwlb_wire[8])'
.meas tran cap_wwlb_wire[7] param='cap(xmem_pipeline.xarray_0.wwlb_wire[7])'
.meas tran cap_wwlb_wire[6] param='cap(xmem_pipeline.xarray_0.wwlb_wire[6])'
.meas tran cap_wwlb_wire[5] param='cap(xmem_pipeline.xarray_0.wwlb_wire[5])'
.meas tran cap_wwlb_wire[4] param='cap(xmem_pipeline.xarray_0.wwlb_wire[4])'
.meas tran cap_wwlb_wire[3] param='cap(xmem_pipeline.xarray_0.wwlb_wire[3])'
.meas tran cap_wwlb_wire[2] param='cap(xmem_pipeline.xarray_0.wwlb_wire[2])'
.meas tran cap_wwlb_wire[1] param='cap(xmem_pipeline.xarray_0.wwlb_wire[1])'
.meas tran cap_wwlb_wire[0] param='cap(xmem_pipeline.xarray_0.wwlb_wire[0])'
.meas tran cap_rwl[15] param='cap(xmem_pipeline.xarray_0.rwl[15])'
.meas tran cap_rwl[14] param='cap(xmem_pipeline.xarray_0.rwl[14])'
.meas tran cap_rwl[13] param='cap(xmem_pipeline.xarray_0.rwl[13])'
.meas tran cap_rwl[12] param='cap(xmem_pipeline.xarray_0.rwl[12])'
.meas tran cap_rwl[11] param='cap(xmem_pipeline.xarray_0.rwl[11])'
.meas tran cap_rwl[10] param='cap(xmem_pipeline.xarray_0.rwl[10])'
.meas tran cap_rwl[9] param='cap(xmem_pipeline.xarray_0.rwl[9])'
.meas tran cap_rwl[8] param='cap(xmem_pipeline.xarray_0.rwl[8])'
.meas tran cap_rwl[7] param='cap(xmem_pipeline.xarray_0.rwl[7])'
.meas tran cap_rwl[6] param='cap(xmem_pipeline.xarray_0.rwl[6])'
.meas tran cap_rwl[5] param='cap(xmem_pipeline.xarray_0.rwl[5])'
.meas tran cap_rwl[4] param='cap(xmem_pipeline.xarray_0.rwl[4])'
.meas tran cap_rwl[3] param='cap(xmem_pipeline.xarray_0.rwl[3])'
.meas tran cap_rwl[2] param='cap(xmem_pipeline.xarray_0.rwl[2])'
.meas tran cap_rwl[1] param='cap(xmem_pipeline.xarray_0.rwl[1])'
.meas tran cap_rwl[0] param='cap(xmem_pipeline.xarray_0.rwl[0])'
.meas tran cap_rwlb[15] param='cap(xmem_pipeline.xarray_0.rwlb[15])'
.meas tran cap_rwlb[14] param='cap(xmem_pipeline.xarray_0.rwlb[14])'
.meas tran cap_rwlb[13] param='cap(xmem_pipeline.xarray_0.rwlb[13])'
.meas tran cap_rwlb[12] param='cap(xmem_pipeline.xarray_0.rwlb[12])'
.meas tran cap_rwlb[11] param='cap(xmem_pipeline.xarray_0.rwlb[11])'
.meas tran cap_rwlb[10] param='cap(xmem_pipeline.xarray_0.rwlb[10])'
.meas tran cap_rwlb[9] param='cap(xmem_pipeline.xarray_0.rwlb[9])'
.meas tran cap_rwlb[8] param='cap(xmem_pipeline.xarray_0.rwlb[8])'
.meas tran cap_rwlb[7] param='cap(xmem_pipeline.xarray_0.rwlb[7])'
.meas tran cap_rwlb[6] param='cap(xmem_pipeline.xarray_0.rwlb[6])'
.meas tran cap_rwlb[5] param='cap(xmem_pipeline.xarray_0.rwlb[5])'
.meas tran cap_rwlb[4] param='cap(xmem_pipeline.xarray_0.rwlb[4])'
.meas tran cap_rwlb[3] param='cap(xmem_pipeline.xarray_0.rwlb[3])'
.meas tran cap_rwlb[2] param='cap(xmem_pipeline.xarray_0.rwlb[2])'
.meas tran cap_rwlb[1] param='cap(xmem_pipeline.xarray_0.rwlb[1])'
.meas tran cap_rwlb[0] param='cap(xmem_pipeline.xarray_0.rwlb[0])'
.meas tran cap_wbl_latch[15] param='cap(xmem_pipeline.xarray_0.wbl_latch[15])'
.meas tran cap_wbl_latch[14] param='cap(xmem_pipeline.xarray_0.wbl_latch[14])'
.meas tran cap_wbl_latch[13] param='cap(xmem_pipeline.xarray_0.wbl_latch[13])'
.meas tran cap_wbl_latch[12] param='cap(xmem_pipeline.xarray_0.wbl_latch[12])'
.meas tran cap_wbl_latch[11] param='cap(xmem_pipeline.xarray_0.wbl_latch[11])'
.meas tran cap_wbl_latch[10] param='cap(xmem_pipeline.xarray_0.wbl_latch[10])'
.meas tran cap_wbl_latch[9] param='cap(xmem_pipeline.xarray_0.wbl_latch[9])'
.meas tran cap_wbl_latch[8] param='cap(xmem_pipeline.xarray_0.wbl_latch[8])'
.meas tran cap_wbl_latch[7] param='cap(xmem_pipeline.xarray_0.wbl_latch[7])'
.meas tran cap_wbl_latch[6] param='cap(xmem_pipeline.xarray_0.wbl_latch[6])'
.meas tran cap_wbl_latch[5] param='cap(xmem_pipeline.xarray_0.wbl_latch[5])'
.meas tran cap_wbl_latch[4] param='cap(xmem_pipeline.xarray_0.wbl_latch[4])'
.meas tran cap_wbl_latch[3] param='cap(xmem_pipeline.xarray_0.wbl_latch[3])'
.meas tran cap_wbl_latch[2] param='cap(xmem_pipeline.xarray_0.wbl_latch[2])'
.meas tran cap_wbl_latch[1] param='cap(xmem_pipeline.xarray_0.wbl_latch[1])'
.meas tran cap_wbl_latch[0] param='cap(xmem_pipeline.xarray_0.wbl_latch[0])'
.meas tran cap_wblb_latch[15] param='cap(xmem_pipeline.xarray_0.wblb_latch[15])'
.meas tran cap_wblb_latch[14] param='cap(xmem_pipeline.xarray_0.wblb_latch[14])'
.meas tran cap_wblb_latch[13] param='cap(xmem_pipeline.xarray_0.wblb_latch[13])'
.meas tran cap_wblb_latch[12] param='cap(xmem_pipeline.xarray_0.wblb_latch[12])'
.meas tran cap_wblb_latch[11] param='cap(xmem_pipeline.xarray_0.wblb_latch[11])'
.meas tran cap_wblb_latch[10] param='cap(xmem_pipeline.xarray_0.wblb_latch[10])'
.meas tran cap_wblb_latch[9] param='cap(xmem_pipeline.xarray_0.wblb_latch[9])'
.meas tran cap_wblb_latch[8] param='cap(xmem_pipeline.xarray_0.wblb_latch[8])'
.meas tran cap_wblb_latch[7] param='cap(xmem_pipeline.xarray_0.wblb_latch[7])'
.meas tran cap_wblb_latch[6] param='cap(xmem_pipeline.xarray_0.wblb_latch[6])'
.meas tran cap_wblb_latch[5] param='cap(xmem_pipeline.xarray_0.wblb_latch[5])'
.meas tran cap_wblb_latch[4] param='cap(xmem_pipeline.xarray_0.wblb_latch[4])'
.meas tran cap_wblb_latch[3] param='cap(xmem_pipeline.xarray_0.wblb_latch[3])'
.meas tran cap_wblb_latch[2] param='cap(xmem_pipeline.xarray_0.wblb_latch[2])'
.meas tran cap_wblb_latch[1] param='cap(xmem_pipeline.xarray_0.wblb_latch[1])'
.meas tran cap_wblb_latch[0] param='cap(xmem_pipeline.xarray_0.wblb_latch[0])'
.meas tran cap_q_wire_0[15] param='cap(xmem_pipeline.xarray_0.q_wire_0[15])'
.meas tran cap_q_wire_0[14] param='cap(xmem_pipeline.xarray_0.q_wire_0[14])'
.meas tran cap_q_wire_0[13] param='cap(xmem_pipeline.xarray_0.q_wire_0[13])'
.meas tran cap_q_wire_0[12] param='cap(xmem_pipeline.xarray_0.q_wire_0[12])'
.meas tran cap_q_wire_0[11] param='cap(xmem_pipeline.xarray_0.q_wire_0[11])'
.meas tran cap_q_wire_0[10] param='cap(xmem_pipeline.xarray_0.q_wire_0[10])'
.meas tran cap_q_wire_0[9] param='cap(xmem_pipeline.xarray_0.q_wire_0[9])'
.meas tran cap_q_wire_0[8] param='cap(xmem_pipeline.xarray_0.q_wire_0[8])'
.meas tran cap_q_wire_0[7] param='cap(xmem_pipeline.xarray_0.q_wire_0[7])'
.meas tran cap_q_wire_0[6] param='cap(xmem_pipeline.xarray_0.q_wire_0[6])'
.meas tran cap_q_wire_0[5] param='cap(xmem_pipeline.xarray_0.q_wire_0[5])'
.meas tran cap_q_wire_0[4] param='cap(xmem_pipeline.xarray_0.q_wire_0[4])'
.meas tran cap_q_wire_0[3] param='cap(xmem_pipeline.xarray_0.q_wire_0[3])'
.meas tran cap_q_wire_0[2] param='cap(xmem_pipeline.xarray_0.q_wire_0[2])'
.meas tran cap_q_wire_0[1] param='cap(xmem_pipeline.xarray_0.q_wire_0[1])'
.meas tran cap_q_wire_0[0] param='cap(xmem_pipeline.xarray_0.q_wire_0[0])'
.end
