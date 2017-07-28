
.INCLUDE "/home/wjin/lincx/library/spice/cmn65gp_mvt_stdcells_mac.sp"

.INCLUDE "array_mac.sp"

*.SUBCKT array WWL3 WWL2 WWL1 WWL0 RWL3 RWL2 RWL1 RWL0 RWLB3 
*+ RWLB2 RWLB1 RWLB0 WBL15 WBL14 WBL13 WBL12 WBL11 WBL10 
*+ WBL9 WBL8 WBL7 WBL6 WBL5 WBL4 WBL3 WBL2 WBL1 WBL0 
*+ WBLB15 WBLB14 WBLB13 WBLB12 WBLB11 WBLB10 WBLB9 WBLB8 WBLB7 
*+ WBLB6 WBLB5 WBLB4 WBLB3 WBLB2 WBLB1 WBLB0 RBL15 RBL14 
*+ RBL13 RBL12 RBL11 RBL10 RBL9 RBL8 RBL7 RBL6 RBL5 RBL4 
*+ RBL3 RBL2 RBL1 RBL0 
*.ENDS

.SUBCKT decoder WEN A1 A0 wwl3 wwl2 wwl1 wwl0 rwl3 rwl2 rwl1 rwl0 rwlb3 rwlb2 rwlb1 rwlb0 VDD VSS 
XU2 A0 n1 n8 VDD VSS ND2D1LVT
XU4 n7 n1 n9 VDD VSS ND2D1LVT
XU7 n6 n1 n10 VDD VSS ND2D1LVT
XU8 n11 WEN rwlb3 VDD VSS ND2D1LVT
XU10 n12 WEN rwlb2 VDD VSS ND2D1LVT
XU12 n13 WEN rwlb1 VDD VSS ND2D1LVT
XU14 n14 WEN rwlb0 VDD VSS ND2D1LVT
XU16 WEN n1 VDD VSS INVD1LVT
XU17 rwlb3 rwl3 VDD VSS INVD1LVT
XU18 rwlb2 rwl2 VDD VSS INVD1LVT
XU19 rwlb1 rwl1 VDD VSS INVD1LVT
XU20 rwlb0 rwl0 VDD VSS INVD1LVT
XU21 A1 n6 VDD VSS INVD1LVT
XU22 A0 n7 VDD VSS INVD1LVT
XU1 n7 n10 wwl1 VDD VSS NR2XD0LVT
XU3 n6 n9 wwl2 VDD VSS NR2XD0LVT
XU5 A0 n10 wwl0 VDD VSS NR2XD0LVT
XU6 n6 n8 wwl3 VDD VSS NR2XD0LVT
XU9 A1 A0 n14 VDD VSS NR2XD0LVT
XU11 A1 n7 n13 VDD VSS NR2XD0LVT
XU13 A0 n6 n12 VDD VSS NR2XD0LVT
XU15 n7 n6 n11 VDD VSS NR2XD0LVT
.ENDS

.SUBCKT bitlines data15 data14 data13 data12 data11 data10 data9 
+ data8 data7 data6 data5 data4 data3 data2 data1 data0 
+ wbl15 wbl14 wbl13 wbl12 wbl11 wbl10 wbl9 wbl8 wbl7 wbl6 
+ wbl5 wbl4 wbl3 wbl2 wbl1 wbl0 wblb15 wblb14 wblb13 wblb12 
+ wblb11 wblb10 wblb9 wblb8 wblb7 wblb6 wblb5 wblb4 wblb3 
+ wblb2 wblb1 wblb0 VDD VSS
*.CONNECT wbl15 data015
*.CONNECT data015 data15
*.CONNECT wbl14 data014
*.CONNECT data014 data14
*.CONNECT wbl13 data013
*.CONNECT data013 data13
*.CONNECT wbl12 data012
*.CONNECT data012 data12
*.CONNECT wbl11 data011
*.CONNECT data011 data11
*.CONNECT wbl10 data010
*.CONNECT data010 data10
*.CONNECT wbl9 data09
*.CONNECT data09 data9
*.CONNECT wbl8 data08
*.CONNECT data08 data8
*.CONNECT wbl7 data07
*.CONNECT data07 data7
*.CONNECT wbl6 data06
*.CONNECT data06 data6
*.CONNECT wbl5 data05
*.CONNECT data05 data5
*.CONNECT wbl4 data04
*.CONNECT data04 data4
*.CONNECT wbl3 data03
*.CONNECT data03 data3
*.CONNECT wbl2 data02
*.CONNECT data02 data2
*.CONNECT wbl1 data01
*.CONNECT data01 data1
*.CONNECT wbl0 data00
*.CONNECT data00 data0
XU1 data15 wblb15 VDD VSS INVD1LVT
XU2 data14 wblb14 VDD VSS INVD1LVT
XU3 data13 wblb13 VDD VSS INVD1LVT
XU4 data12 wblb12 VDD VSS INVD1LVT
XU5 data11 wblb11 VDD VSS INVD1LVT
XU6 data10 wblb10 VDD VSS INVD1LVT
XU7 data9 wblb9 VDD VSS INVD1LVT
XU8 data8 wblb8 VDD VSS INVD1LVT
XU9 data7 wblb7 VDD VSS INVD1LVT
XU10 data6 wblb6 VDD VSS INVD1LVT
XU11 data5 wblb5 VDD VSS INVD1LVT
XU12 data4 wblb4 VDD VSS INVD1LVT
XU13 data3 wblb3 VDD VSS INVD1LVT
XU14 data2 wblb2 VDD VSS INVD1LVT
XU15 data1 wblb1 VDD VSS INVD1LVT
XU16 data0 wblb0 VDD VSS INVD1LVT
.ENDS

.SUBCKT mem_top CLK WEN A1 A0 D15 D14 D13 D12 D11 D10 D9 D8 
+ D7 D6 D5 D4 D3 D2 D1 D0 Q15 Q14 Q13 Q12 Q11 Q10 
+ Q9 Q8 Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 VDD VSS 
Xdecoder WEN A1 A0 wwl3 wwl2 wwl1 wwl0 rwl3 rwl2 rwl1 rwl0 
+ rwlb3 rwlb2 rwlb1 rwlb0 VDD VSS decoder 
Xbitlines D15 D14 D13 D12 D11 D10 D9 D8 D7 D6 D5 D4 
+ D3 D2 D1 D0 wbl15 wbl14 wbl13 wbl12 wbl11 wbl10 wbl9 
+ wbl8 wbl7 wbl6 wbl5 wbl4 wbl3 wbl2 wbl1 wbl0 wblb15 
+ wblb14 wblb13 wblb12 wblb11 wblb10 wblb9 wblb8 wblb7 wblb6 
+ wblb5 wblb4 wblb3 wblb2 wblb1 wblb0 VDD VSS bitlines 
Xwbl_latch_0 D0 CLK wbl_latch0 VDD VSS DFQD1 
Xwbl_latch_1 D1 CLK wbl_latch1 VDD VSS DFQD1 
Xwbl_latch_2 D2 CLK wbl_latch2 VDD VSS DFQD1 
Xwbl_latch_3 D3 CLK wbl_latch3 VDD VSS DFQD1 
Xwbl_latch_4 D4 CLK wbl_latch4 VDD VSS DFQD1 
Xwbl_latch_5 D5 CLK wbl_latch5 VDD VSS DFQD1 
Xwbl_latch_6 D6 CLK wbl_latch6 VDD VSS DFQD1 
Xwbl_latch_7 D7 CLK wbl_latch7 VDD VSS DFQD1 
Xwbl_latch_8 D8 CLK wbl_latch8 VDD VSS DFQD1 
Xwbl_latch_9 D9 CLK wbl_latch9 VDD VSS DFQD1 
Xwbl_latch_10 D10 CLK wbl_latch10 VDD VSS DFQD1 
Xwbl_latch_11 D11 CLK wbl_latch11 VDD VSS DFQD1 
Xwbl_latch_12 D12 CLK wbl_latch12 VDD VSS DFQD1 
Xwbl_latch_13 D13 CLK wbl_latch13 VDD VSS DFQD1 
Xwbl_latch_14 D14 CLK wbl_latch14 VDD VSS DFQD1 
Xwbl_latch_15 D15 CLK wbl_latch15 VDD VSS DFQD1 
Xwblb_latch_0 wblb0 CLK wblb_latch0 VDD VSS DFQD1 
Xwblb_latch_1 wblb1 CLK wblb_latch1 VDD VSS DFQD1 
Xwblb_latch_2 wblb2 CLK wblb_latch2 VDD VSS DFQD1 
Xwblb_latch_3 wblb3 CLK wblb_latch3 VDD VSS DFQD1 
Xwblb_latch_4 wblb4 CLK wblb_latch4 VDD VSS DFQD1 
Xwblb_latch_5 wblb5 CLK wblb_latch5 VDD VSS DFQD1 
Xwblb_latch_6 wblb6 CLK wblb_latch6 VDD VSS DFQD1 
Xwblb_latch_7 wblb7 CLK wblb_latch7 VDD VSS DFQD1 
Xwblb_latch_8 wblb8 CLK wblb_latch8 VDD VSS DFQD1 
Xwblb_latch_9 wblb9 CLK wblb_latch9 VDD VSS DFQD1 
Xwblb_latch_10 wblb10 CLK wblb_latch10 VDD VSS DFQD1 
Xwblb_latch_11 wblb11 CLK wblb_latch11 VDD VSS DFQD1 
Xwblb_latch_12 wblb12 CLK wblb_latch12 VDD VSS DFQD1 
Xwblb_latch_13 wblb13 CLK wblb_latch13 VDD VSS DFQD1 
Xwblb_latch_14 wblb14 CLK wblb_latch14 VDD VSS DFQD1 
Xwblb_latch_15 wblb15 CLK wblb_latch15 VDD VSS DFQD1 
Xarray0 wwl_wire3 wwl_wire2 wwl_wire1 wwl_wire0 rwl3 rwl2 rwl1 
+ rwl0 rwlb3 rwlb2 rwlb1 rwlb0 wbl_latch15 wbl_latch14 
+ wbl_latch13 wbl_latch12 wbl_latch11 wbl_latch10 wbl_latch9 
+ wbl_latch8 wbl_latch7 wbl_latch6 wbl_latch5 wbl_latch4 wbl_latch3 
+ wbl_latch2 wbl_latch1 wbl_latch0 wblb_latch15 wblb_latch14 
+ wblb_latch13 wblb_latch12 wblb_latch11 wblb_latch10 wblb_latch9 
+ wblb_latch8 wblb_latch7 wblb_latch6 wblb_latch5 wblb_latch4 
+ wblb_latch3 wblb_latch2 wblb_latch1 wblb_latch0 Q15 Q14 Q13 
+ Q12 Q11 Q10 Q9 Q8 Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 VDD VSS array 
Xwwl_latch_reg_3_ wwl3 CLK wwl_latch3 VDD VSS LNQD1LVT
Xwwl_latch_reg_2_ wwl2 CLK wwl_latch2 VDD VSS LNQD1LVT
Xwwl_latch_reg_1_ wwl1 CLK wwl_latch1 VDD VSS LNQD1LVT
Xwwl_latch_reg_0_ wwl0 CLK wwl_latch0 VDD VSS LNQD1LVT
XU2 wwl_latch3 CLK wwl_wire3 VDD VSS AN2D1LVT
XU3 wwl_latch2 CLK wwl_wire2 VDD VSS AN2D1LVT
XU4 wwl_latch1 CLK wwl_wire1 VDD VSS AN2D1LVT
XU5 wwl_latch0 CLK wwl_wire0 VDD VSS AN2D1LVT
XU6 CLK n1 VDD VSS INVD1LVT
.ENDS

.SUBCKT sram CLK WEN A1 A0 D15 D14 D13 D12 D11 D10 D9 
+ D8 D7 D6 D5 D4 D3 D2 D1 D0 Q15 Q14 Q13 Q12 Q11 
+ Q10 Q9 Q8 Q7 Q6 Q5 Q4 Q3 Q2 Q1 Q0 VDD VSS
Xmem_top CLK wen_reg a_reg1 a_reg0 d_reg15 d_reg14 d_reg13 d_reg12 
+ d_reg11 d_reg10 d_reg9 d_reg8 d_reg7 d_reg6 d_reg5 d_reg4 
+ d_reg3 d_reg2 d_reg1 d_reg0 q_wire15 q_wire14 q_wire13 
+ q_wire12 q_wire11 q_wire10 q_wire9 q_wire8 q_wire7 q_wire6 
+ q_wire5 q_wire4 q_wire3 q_wire2 q_wire1 q_wire0 VDD VSS mem_top 
Xwen_reg_reg WEN CLK wen_reg VDD VSS DFQD1 
Xa_reg_reg_1_ A1 CLK a_reg1 VDD VSS DFQD1 
Xa_reg_reg_0_ A0 CLK a_reg0 VDD VSS DFQD1 
Xd_reg_reg_15_ D15 CLK d_reg15 VDD VSS DFQD1 
Xd_reg_reg_14_ D14 CLK d_reg14 VDD VSS DFQD1 
Xd_reg_reg_13_ D13 CLK d_reg13 VDD VSS DFQD1 
Xd_reg_reg_12_ D12 CLK d_reg12 VDD VSS DFQD1 
Xd_reg_reg_11_ D11 CLK d_reg11 VDD VSS DFQD1 
Xd_reg_reg_10_ D10 CLK d_reg10 VDD VSS DFQD1 
Xd_reg_reg_9_ D9 CLK d_reg9 VDD VSS DFQD1 
Xd_reg_reg_8_ D8 CLK d_reg8 VDD VSS DFQD1 
Xd_reg_reg_7_ D7 CLK d_reg7 VDD VSS DFQD1 
Xd_reg_reg_6_ D6 CLK d_reg6 VDD VSS DFQD1 
Xd_reg_reg_5_ D5 CLK d_reg5 VDD VSS DFQD1 
Xd_reg_reg_4_ D4 CLK d_reg4 VDD VSS DFQD1 
Xd_reg_reg_3_ D3 CLK d_reg3 VDD VSS DFQD1 
Xd_reg_reg_2_ D2 CLK d_reg2 VDD VSS DFQD1 
Xd_reg_reg_1_ D1 CLK d_reg1 VDD VSS DFQD1 
Xd_reg_reg_0_ D0 CLK d_reg0 VDD VSS DFQD1 
XQ_reg_15_ q_wire15 CLK Q15 VDD VSS DFQD1 
XQ_reg_14_ q_wire14 CLK Q14 VDD VSS DFQD1 
XQ_reg_13_ q_wire13 CLK Q13 VDD VSS DFQD1 
XQ_reg_12_ q_wire12 CLK Q12 VDD VSS DFQD1 
XQ_reg_11_ q_wire11 CLK Q11 VDD VSS DFQD1 
XQ_reg_10_ q_wire10 CLK Q10 VDD VSS DFQD1 
XQ_reg_9_ q_wire9 CLK Q9 VDD VSS DFQD1 
XQ_reg_8_ q_wire8 CLK Q8 VDD VSS DFQD1 
XQ_reg_7_ q_wire7 CLK Q7 VDD VSS DFQD1 
XQ_reg_6_ q_wire6 CLK Q6 VDD VSS DFQD1 
XQ_reg_5_ q_wire5 CLK Q5 VDD VSS DFQD1 
XQ_reg_4_ q_wire4 CLK Q4 VDD VSS DFQD1 
XQ_reg_3_ q_wire3 CLK Q3 VDD VSS DFQD1 
XQ_reg_2_ q_wire2 CLK Q2 VDD VSS DFQD1 
XQ_reg_1_ q_wire1 CLK Q1 VDD VSS DFQD1 
XQ_reg_0_ q_wire0 CLK Q0 VDD VSS DFQD1 
.ENDS
.GLOBAL VDD 
.GLOBAL VSS 
