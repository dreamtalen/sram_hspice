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

*define parameters
 .param supply0=0.35
 * .param SD=9.999999999999999e-12
 .param SD=50n
 .param st=200n
 .param slew=3.44e-10
 .param load=5.9e-16

 .include '10t.init.sp'
 * .include '10t.sp'
 .subckt bitcell WWLB WBL WBLB RWL RWLB RBL roli VDD VSS
M0 lori WWLB WBL VDD PCH W=0.260U L=0.06U
M1 lori roli VDD VDD PCH W=0.260U L=0.06U
M2 lori roli VSS VSS NCH W=0.195U L=0.06U
M3 roli lori VDD VDD PCH W=0.260U L=0.06U
M4 roli lori VSS VSS NCH W=0.195U L=0.06U
M5 roli WWLB WBLB VDD PCH W=0.260U L=0.06U
M6 rbit roli VDD VDD PCH W=0.260U L=0.06U
M7 rbit roli VSS VSS NCH W=0.195U L=0.06U
M8 rbit RWLB RBL VDD PCH W=0.260U L=0.06U
M9 rbit RWL RBL VSS NCH W=0.195U L=0.06U
.ends

 xbitcell WWLB WBL WBLB RWL RWLB RBL roli VDD VSS bitcell

 vvdd VDD 0 dc 'supply0'
 vvss VSS 0 dc 0
 ccap_q RBL 0 'load'

 .param pw=20n
 vrwl RWL 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
 vrwlb RWLB 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
 vwwlb WWLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')

 vwbl WBL 0 pulse (0 supply0 'pw*0.25' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')
 vwblb WBLB 0 pulse (supply0 0 'pw*0.25' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')

 * vrwl RWL 0 pwl
 * + 0 0
 * + 'SD' 0
 * + 'SD + slew*2.5' 'supply0'
 * + 'st' 'supply0'
 * vrwlb RWLB 0 pwl
 * + 0 'supply0'
 * + 'SD' 'supply0'
 * + 'SD + slew*2.5' 0
 * + 'st' 0

.PROBE TRAN V(roli)
.PROBE TRAN V(WBL)
.PROBE TRAN V(WWLB)
.PROBE TRAN V(RWL)
.PROBE TRAN V(RBL)
.PROBE TRAN V(xbitcell.rbit)
.TRAN 3.5P 'st'
.measure tran delay_rwl_q trig v(RWL) val=0.175 cross=1 targ v(RBL) val=0.175 cross=1 td=SD
.measure tran transition_rwl_q trig v(RBL) val=0.105 cross=1 targ v(RBL) val=0.245 cross=1 td=SD
.end