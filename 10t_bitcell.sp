 * include model and subckts
 .lib '/home/wjin/TSMC_65/hspice_model/crn65gplus_2d5_lk_v1d0.l' tt

 .TEMP 25

*.BIPOLAR
*.RESI = 2000
*.RESVAL
*.CAPVAL
*.DIOPERI
*.DIOAREA
*.EQUATION
*.SCALE METER
*.MEGA
.PARAM

*.GLOBAL vdd
+        gnd

*.PIN vdd
*+    gnd

*define options
 .option post=1
 .option accurate=1
 .option gmin=1e-15
 .option gmindc=1.0e-15
 .option method=gear

*define parameters
 .param supply0=0.35
 .param SD=50n
 .param st=200n
 .param slew=3.44e-10
 .param load=5.9e-16

.SUBCKT 10TSRAM_test_nmos_mac GND Q QB RBL RWL RWLB VDD WBL WBLB WWLB
*.PININFO GND:I Q:I QB:I RWL:I RWLB:I VDD:I WBL:I WBLB:I WWLB:I RBL:O
MM8 net08 RWL RBL GND nch l=60n w=120.0n m=1
MM7 net08 QB GND GND nch l=60n w=120.0n m=1
MM2 QB Q GND GND nch l=60n w=120.0n m=1
MM0 Q QB GND GND nch l=60n w=120.0n m=1
MM1 WBL WWLB Q GND nch l=60n w=120.0n m=1
MM5 WBLB WWLB QB GND nch l=60n w=120.0n m=1
MM9 net08 RWLB RBL VDD pch l=60n w=360.0n m=1
MM6 net08 QB VDD VDD pch l=60n w=360.0n m=1
MM3 Q QB VDD VDD pch l=60n w=360.0n m=1
MM4 QB Q VDD VDD pch l=60n w=360.0n m=1
.ENDS

XI17 gnd q qb RBL RWL RWLB vdd WBL WBLB WWLB 10TSRAM_test_nmos_mac

vvdd VDD 0 dc 'supply0'
ccap_q RBL 0 'load'

.param pw=20n
vrwl RWL 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vrwlb RWLB 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vwwlb WWLB 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')

vwbl WBL 0 pulse (0 supply0 'pw*0.25' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')
vwblb WBLB 0 pulse (supply0 0 'pw*0.25' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')


.TRAN 3.5P 'st'
.end