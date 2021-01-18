`timescale 1ns/1ps

module sorting(rank0, rank1, rank2, rank3, rank4, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4;
	output [5:0] rank0, rank1, rank2, rank3, rank4;
//---------------------------------------------------
	wire [5:0] i0, i1, i2, i3, i4;
	wire [5:0] rank0, rank1, rank2, rank3, rank4;
	wire s1, s2, s3, s4, s5, s6, s7, s8, s9, s10;
	wire s1_bar, s2_bar, s3_bar, s4_bar, s5_bar, s6_bar, s7_bar, s8_bar, s9_bar, s10_bar;
	wire [5:0] tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, tmp10, tmp11, tmp12, tmp13, tmp14;
	wire c1, c2, c3, c4, c5, c6, c7, c8;
	wire c9, c9_1, c9_2, c9_3, c9_4;
	wire c10, c10_1, c10_2, c10_3, c10_4;
	wire c11, c11_1, c11_2, c11_3, c11_4;
	wire c12, c12_1, c12_2, c12_3, c12_4;
	wire c13, c13_1, c13_2, c13_3, c13_4;
	wire c14, c14_1, c14_2, c14_3, c14_4;
	wire c15, c15_1, c15_2, c15_3, c15_4;
	wire c16, c16_1, c16_2, c16_3, c16_4;
	wire c17, c17_1, c17_2, c17_3, c17_4, c17_5, c17_6, m17_1, m17_2;
	wire c18, c18_1, c18_2, c18_3, c18_4, c18_5, c18_6, m18_1, m18_2;
	wire c19, c19_1, c19_2, c19_3, c19_4, c19_5, c19_6, m19_1, m19_2;
	wire c20, c20_1, c20_2, c20_3, c20_4, c20_5, c20_6, m20_1, m20_2;
	wire f0, f1, f2, f3, f4;

	COMPARATOR sign1(s1,i0,i1);
	COMPARATOR sign2(s2,i0,i2);
	COMPARATOR sign3(s3,i0,i3);
	COMPARATOR sign4(s4,i0,i4);
	COMPARATOR sign5(s5,i1,i2);
	COMPARATOR sign6(s6,i1,i3);
	COMPARATOR sign7(s7,i1,i4);
	COMPARATOR sign8(s8,i2,i3);
	COMPARATOR sign9(s9,i2,i4);
	COMPARATOR sign10(s10,i3,i4);
	
	IV sign1_iv(s1_bar,s1);
	IV sign2_iv(s2_bar,s2);
	IV sign3_iv(s3_bar,s3);
	IV sign4_iv(s4_bar,s4);
	IV sign5_iv(s5_bar,s5);
	IV sign6_iv(s6_bar,s6);
	IV sign7_iv(s7_bar,s7);
	IV sign8_iv(s8_bar,s8);
	IV sign9_iv(s9_bar,s9);
	IV sign10_iv(s10_bar,s10);
	
	//-----------------rank0-------------------
	AN4 cond1(c1,s1_bar,s5,s6,s7);
	AN4 cond2(c2,s2_bar,s5_bar,s8,s9);
	AN4 cond3(c3,s3_bar,s6_bar,s8_bar,s10);
	AN4 cond4(c4,s4_bar,s7_bar,s9_bar,s10_bar);
	OR2 cond0i2i1(f0,c1,c2);
	//select rank0
	SELECT rank0_0(tmp0,i1,i2,c2);
	SELECT rank0_1(tmp1,i0,i3,c3);
	SELECT rank0_2(tmp2,tmp1,i4,c4);
	SELECT rank0_3(rank0,tmp2,tmp0,f0);
	//-----------------------------------------

	//-----------------rank4-------------------
	NR4 cond5(c5,s1_bar,s5,s6,s7);
	NR4 cond6(c6,s2_bar,s5_bar,s8,s9);
	NR4 cond7(c7,s3_bar,s6_bar,s8_bar,s10);
	NR4 cond8(c8,s4_bar,s7_bar,s9_bar,s10_bar);
	OR2 cond4i2i1(f4,c5,c6);
	//select rank4
	SELECT rank4_0(tmp3,i1,i2,c6);
	SELECT rank4_1(tmp4,i0,i3,c7);
	SELECT rank4_2(tmp5,tmp4,i4,c8);
	SELECT rank4_3(rank4,tmp5,tmp3,f4);
	//-----------------------------------------

	//-----------------rank1-------------------
	//c9
	ND4 cond9_1(c9_1,s1,s5,s6,s7);
	ND4 cond9_2(c9_2,s1_bar,s5_bar,s6,s7);
	ND4 cond9_3(c9_3,s1_bar,s5,s6_bar,s7);
	ND4 cond9_4(c9_4,s1_bar,s5,s6,s7_bar);
	ND4 cond9(c9,c9_1,c9_2,c9_3,c9_4);
	//c10
	ND4 cond10_1(c10_1,s2,s5_bar,s8,s9);
	ND4 cond10_2(c10_2,s2_bar,s5,s8,s9);
	ND4 cond10_3(c10_3,s2_bar,s5_bar,s8_bar,s9);
	ND4 cond10_4(c10_4,s2_bar,s5_bar,s8,s9_bar);
	ND4 cond10(c10,c10_1,c10_2,c10_3,c10_4);
	//c11
	ND4 cond11_1(c11_1,s3,s6_bar,s8_bar,s10);
	ND4 cond11_2(c11_2,s3_bar,s6,s8_bar,s10);
	ND4 cond11_3(c11_3,s3_bar,s6_bar,s8,s10);
	ND4 cond11_4(c11_4,s3_bar,s6_bar,s8_bar,s10_bar);
	ND4 cond11(c11,c11_1,c11_2,c11_3,c11_4);
	//c12
	ND4 cond12_1(c12_1,s4,s7_bar,s9_bar,s10_bar);
	ND4 cond12_2(c12_2,s4_bar,s7,s9_bar,s10_bar);
	ND4 cond12_3(c12_3,s4_bar,s7_bar,s9,s10_bar);
	ND4 cond12_4(c12_4,s4_bar,s7_bar,s9_bar,s10);
	ND4 cond12(c12,c12_1,c12_2,c12_3,c12_4);
	OR2 cond1i2i1(f1,c9,c10);
    //select rank1
	SELECT rank1_0(tmp6,i1,i2,c10);
	SELECT rank1_1(tmp7,i0,i3,c11);
	SELECT rank1_2(tmp8,tmp7,i4,c12);
	SELECT rank1_3(rank1,tmp8,tmp6,f1);
	//-----------------------------------------

	//-----------------rank3-------------------
	//c13
	ND4 cond13_1(c13_1,s1_bar,s5_bar,s6_bar,s7_bar);
	ND4 cond13_2(c13_2,s1,s5,s6_bar,s7_bar);
	ND4 cond13_3(c13_3,s1,s5_bar,s6,s7_bar);
	ND4 cond13_4(c13_4,s1,s5_bar,s6_bar,s7);
	ND4 cond13(c13,c13_1,c13_2,c13_3,c13_4);
	//c14
	ND4 cond14_1(c14_1,s2_bar,s5,s8_bar,s9_bar);
	ND4 cond14_2(c14_2,s2,s5_bar,s8_bar,s9_bar);
	ND4 cond14_3(c14_3,s2,s5,s8,s9_bar);
	ND4 cond14_4(c14_4,s2,s5,s8_bar,s9);
	ND4 cond14(c14,c14_1,c14_2,c14_3,c14_4);
	//c15
	ND4 cond15_1(c15_1,s3_bar,s6,s8,s10_bar);
	ND4 cond15_2(c15_2,s3,s6_bar,s8,s10_bar);
	ND4 cond15_3(c15_3,s3,s6,s8_bar,s10_bar);
	ND4 cond15_4(c15_4,s3,s6,s8,s10);
	ND4 cond15(c15,c15_1,c15_2,c15_3,c15_4);
	//c16
	ND4 cond16_1(c16_1,s4_bar,s7,s9,s10);
	ND4 cond16_2(c16_2,s4,s7_bar,s9,s10);
	ND4 cond16_3(c16_3,s4,s7,s9_bar,s10);
	ND4 cond16_4(c16_4,s4,s7,s9,s10_bar);
	ND4 cond16(c16,c16_1,c16_2,c16_3,c16_4);	
	OR2 cond3i2i1(f3,c13,c14);
	//select rank3
	SELECT rank3_0(tmp9,i1,i2,c14);
	SELECT rank3_1(tmp10,i0,i3,c15);
	SELECT rank3_2(tmp11,tmp10,i4,c16);
	SELECT rank3_3(rank3,tmp11,tmp9,f3);
	//-----------------------------------------

	//-----------------rank2-------------------
	//c17
	ND4 cond17_1(c17_1,s1,s5_bar,s6,s7);
	ND4 cond17_2(c17_2,s1,s5,s6_bar,s7);
	ND4 cond17_3(c17_3,s1,s5,s6,s7_bar);
	ND4 cond17_4(c17_4,s1_bar,s5_bar,s6_bar,s7);
	ND4 cond17_5(c17_5,s1_bar,s5_bar,s6,s7_bar);
	ND4 cond17_6(c17_6,s1_bar,s5,s6_bar,s7_bar);
	AN3 merge17_1to3(m17_1,c17_1,c17_2,c17_3);
	AN3 merge17_4to6(m17_2,c17_4,c17_5,c17_6);
	ND2 cond17(c17,m17_1,m17_2);
	//c18
	ND4 cond18_1(c18_1,s2,s5,s8,s9);
	ND4 cond18_2(c18_2,s2,s5_bar,s8_bar,s9);
	ND4 cond18_3(c18_3,s2,s5_bar,s8,s9_bar);
	ND4 cond18_4(c18_4,s2_bar,s5,s8_bar,s9);
	ND4 cond18_5(c18_5,s2_bar,s5,s8,s9_bar);
	ND4 cond18_6(c18_6,s2_bar,s5_bar,s8_bar,s9_bar);
	AN3 merge18_1to3(m18_1,c18_1,c18_2,c18_3);
	AN3 merge18_4to6(m18_2,c18_4,c18_5,c18_6);
	ND2 cond18(c18,m18_1,m18_2);
	//c19
	ND4 cond19_1(c19_1,s3,s6,s8_bar,s10);
	ND4 cond19_2(c19_2,s3,s6_bar,s8,s10);
	ND4 cond19_3(c19_3,s3,s6_bar,s8_bar,s10_bar);
	ND4 cond19_4(c19_4,s3_bar,s6,s8,s10);
	ND4 cond19_5(c19_5,s3_bar,s6,s8_bar,s10_bar);
	ND4 cond19_6(c19_6,s3_bar,s6_bar,s8,s10_bar);
	AN3 merge19_1to3(m19_1,c19_1,c19_2,c19_3);
	AN3 merge19_4to6(m19_2,c19_4,c19_5,c19_6);
	ND2 cond19(c19,m19_1,m19_2);
	//c20
	ND4 cond20_1(c20_1,s4,s7,s9_bar,s10_bar);
	ND4 cond20_2(c20_2,s4,s7_bar,s9,s10_bar);
	ND4 cond20_3(c20_3,s4,s7_bar,s9_bar,s10);
	ND4 cond20_4(c20_4,s4_bar,s7,s9,s10_bar);
	ND4 cond20_5(c20_5,s4_bar,s7,s9_bar,s10);
	ND4 cond20_6(c20_6,s4_bar,s7_bar,s9,s10);
	AN3 merge20_1to3(m20_1,c20_1,c20_2,c20_3);
	AN3 merge20_4to6(m20_2,c20_4,c20_5,c20_6);
	ND2 cond20(c20,m20_1,m20_2);	
	OR2 cond2i2i1(f2,c17,c18);
	//select rank2
	SELECT rank2_0(tmp12,i1,i2,c18);
	SELECT rank2_1(tmp13,i0,i3,c19);
	SELECT rank2_2(tmp14,tmp13,i4,c20);
	SELECT rank2_3(rank2,tmp14,tmp12,f2);
	//-----------------------------------------

endmodule

module COMPARATOR(sign, a, b);
	input [5:0] a, b;
	wire o1, o2, o3;
	wire gt1, gt2, gt3, eq1, eq2, eq3;
	output sign;	

	TWO_BIT_COMP block1(gt1, eq1, a[5:4], b[5:4]);
	TWO_BIT_COMP block2(gt2, eq2, a[3:2], b[3:2]);
	TWO_BIT_COMP block3(gt3, eq3, a[1:0], b[1:0]);
	IV cond1(o1,gt1);
	//sign = (lt1 | (eq1 & lt2) | (eq1 & eq2 & lt3));
	ND2 cond2(o2,eq1,gt2);
	ND3 cond3(o3,eq1,eq2,gt3);
	ND3 get_sign(sign,o1,o2,o3);

endmodule

module TWO_BIT_COMP(gt, eq, a, b);
	input [1:0] a, b;
	wire [1:0] b_bar;
	output gt, eq;
	wire x0, x1, x2, x3, x4;

	IV inv0(b_bar[0],b[0]);
	IV inv1(b_bar[1],b[1]);
	EO xor0(x0,a[0],b[0]);
	EO xor1(x1,a[1],b[1]);
	ND3 nd0(x2,b_bar[0],b_bar[1],a[0]);
	ND3 nd1(x3,b_bar[0],a[0],a[1]);
	ND2 nd2(x4,b_bar[1],a[1]);
	NR2 get_eq(eq,x0,x1);
	ND3 get_gt(gt,x2,x3,x4);

endmodule

module SELECT(out, a, b, sign);
	input [5:0] a, b;
	input sign;
	output [5:0] out;

	MUX21H select_0(out[0],a[0],b[0],sign);
	MUX21H select_1(out[1],a[1],b[1],sign);
	MUX21H select_2(out[2],a[2],b[2],sign);
	MUX21H select_3(out[3],a[3],b[3],sign);
	MUX21H select_4(out[4],a[4],b[4],sign);
	MUX21H select_5(out[5],a[5],b[5],sign);

endmodule

