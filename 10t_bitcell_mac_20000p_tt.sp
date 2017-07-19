 * include model and subckts
 .lib '/home/eda/dk/TSMC_65/cadence/models/hspice/crn65gplus_2d5_lk_v1d0.l' tt
* ff ss fs sf 
* ff + 85, ss + -25
 .TEMP 25

*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear
 .option mcbrief=1
*define parameters
 .param supply0=0.35
 .param SD=50n
 .param st=200n
 .param slew=3.44e-10
 .param load=5.9e-16

.SUBCKT sram_10t_bitcell GND Q QB RBL RWL RWLB VDD WBL WBLB WWLB
*.PININFO GND:I Q:I QB:I RWL:I RWLB:I VDD:I WBL:I WBLB:I WWLB:I RBL:O
XMM8 net08 RWL RBL GND nch_mac l=60n w=120.0n m=1
XMM7 net08 QB GND GND nch_mac l=60n w=120.0n m=1
XMM2 QB Q GND GND nch_mac l=60n w=120.0n m=1
XMM0 Q QB GND GND nch_mac l=60n w=120.0n m=1
XMM1 WBL WWLB Q GND nch_mac l=60n w=240.0n m=1
XMM5 WBLB WWLB QB GND nch_mac l=60n w=240.0n m=1
XMM9 net08 RWLB RBL VDD pch_mac l=60n w=360.0n m=1
XMM6 net08 QB VDD VDD pch_mac l=60n w=360.0n m=1
XMM3 Q QB VDD VDD pch_mac l=60n w=360.0n m=1
XMM4 QB Q VDD VDD pch_mac l=60n w=360.0n m=1
.ENDS

XI17 gnd q qb RBL RWL RWLB vdd WBL WBLB WWLB sram_10t_bitcell

vvdd VDD 0 dc 'supply0'
ccap_q RBL 0 'load'

.param pw=20n
vrwl RWLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vrwlb RWL 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vwwlb WWLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')

vwbl WBL 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')
vwblb WBLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')

.TRAN 3.5P 'st' SWEEP MONTE=20000
.measure TRAN delay_write1
+	TRIG v(WWLB) VAL='supply0/2' RISE=1
+	TARG v(q) VAL='supply0/2' RISE=1

.measure TRAN delay_read1
+	TRIG v(RWL) VAL='supply0/2' RISE=2
+	TARG v(RBL) VAL='supply0/2' RISE=1

.measure TRAN delay_write0
+	TRIG v(WWLB) VAL='supply0/2' RISE=2
+	TARG v(q) VAL='supply0/2' FALL=1

.measure TRAN delay_read0
+	TRIG v(RWL) VAL='supply0/2' RISE=3
+	TARG v(RBL) VAL='supply0/2' FALL=1
.end