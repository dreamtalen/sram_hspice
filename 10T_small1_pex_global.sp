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
 .option mcbrief=1
*define parameters
 .param supply0=0.35
 .param SD=50n
 .param st=200n
 .param slew=3.44e-10
 .param load=5.9e-16

.include "/home/wjin/dmtalen/sram/10TSRAM_PEX/10TSRAM_small1.pex.netlist.pex"
.subckt SRAM10T_small1  GND RBL RWL RWLB VDD WBL WBLB WWLB
MM8 N_NET08_MM8_d N_RWL_MM8_g N_RBL_MM8_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07 M=1
MM7 N_NET08_MM7_d N_QB_MM7_g N_GND_MM7_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07 M=1
MM10 N_WBL_MM10_d N_WWLB_MM10_g N_Q_MM10_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07
+ M=1
MM11 N_WBLB_MM11_d N_WWLB_MM11_g N_QB_MM11_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07
+ M=1
MM1 N_Q_MM1_d N_QB_MM1_g N_GND_MM1_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07 M=1
MM0 N_QB_MM0_d N_Q_MM0_g N_GND_MM0_s N_GND_MM10_b NCH L=6e-08 W=1.2e-07 M=1
MM9 N_NET08_MM9_d N_RWLB_MM9_g N_RBL_MM9_s N_VDD_MM5_b PCH L=6e-08 W=1.2e-07 M=1
MM6 N_NET08_MM6_d N_QB_MM6_g N_VDD_MM6_s N_VDD_MM5_b PCH L=6e-08 W=1.2e-07 M=1
MM5 N_Q_MM5_d N_QB_MM5_g N_VDD_MM5_s N_VDD_MM5_b PCH L=6e-08 W=1.2e-07 M=1
MM4 N_QB_MM4_d N_Q_MM4_g N_VDD_MM4_s N_VDD_MM5_b PCH L=6e-08 W=1.2e-07 M=1
.include "/home/wjin/dmtalen/sram/10TSRAM_PEX/10TSRAM_small1.pex.netlist.10TSRAM_SMALL1.pxi"

.ends

XI17 gnd RBL RWL RWLB vdd WBL WBLB WWLB SRAM10T_small1

vvdd VDD 0 dc 'supply0'
ccap_q RBL 0 'load'

.param pw=20n
vrwl RWLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vrwlb RWL 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vwwlb WWLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' pw '2*pw')
vwbl WBL 0 pulse (0 supply0 'pw-5*slew' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')
vwblb WBLB 0 pulse (supply0 0 'pw-5*slew' 'slew*2.5' 'slew*2.5' 'pw*2' 'pw*4')

.TRAN 3.5P 'st' SWEEP MONTE=300
.measure TRAN write1 AVG v(XI17.N_Q_MM1_d) FROM=49ns TO=51ns
.measure TRAN read1 AVG v(rbl) FROM=69ns TO=71ns
.measure TRAN write0 AVG v(XI17.N_Q_MM1_d) FROM=89ns TO=91ns
.measure TRAN read0 AVG v(XI17.N_Q_MM1_d) FROM=109ns TO=111ns
.end