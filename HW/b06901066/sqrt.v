module sqrt (
	input clk,
	input rst_n,
	input [9:0] i_radicand,
	output o_finish,
	output [4:0] o_root,
	output [50:0] number
);
//registers and wire
wire s1,s2,s3;
wire [8:0] stage12;
wire [7:0] stage23;
wire [6:0] stage34;
wire bo0, bo1, bo2, bo3, bo4, bo5, bo6, bo7, bo8, bo9, bo10, bo11, bo12, bo13, bo14, bo15, bo16, bo17, bo18, bo19, bo20, bo21, bo22, bo23;
wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23;
wire [1:0] q43;
wire [2:0] q432;
wire [3:0] q4321;
wire [50:0] R_num1, R_num2, R_num3; //radicand
wire [50:0] Q_num1, Q_num2, Q_num3, Q_num4; //quotient
wire [50:0] F_num1, F_num2, F_num3, F_num4; //flag
wire [50:0] C_num [0:23]; //CSM block

// ******** start pipeline ********
//stage1
//stage1_1
CSM_F block0(bo0,d0,i_radicand[9],bo1,bo0,C_num[0]);
CSM_D block1(bo1,d1,i_radicand[8],bo0,C_num[1]);
//stage1_2
CSM_B block2(bo2,d0,bo3,C_num[2]);
CSM_C block3(bo3,d3,d1,bo0,bo4,bo2,C_num[3]);
CSM_E block4(bo4,d4,i_radicand[7],bo5,bo2,C_num[4]);
CSM_D block5(bo5,d5,i_radicand[6],bo2,C_num[5]);
REGP#(2) Q1(clk, rst_n, q43, {bo0,bo2}, Q_num1);
REGP#(9) R1(clk, rst_n, stage12, {d3,d4,d5,i_radicand[5:0]}, R_num1);
REGP#(1) F1(clk, rst_n, s1, 1'b1, F_num1); //flag_1
//stage2
CSM_B block6(bo6,stage12[8],bo7,C_num[6]);
CSM_C block7(bo7,d7,stage12[7],q43[1],bo8,bo6,C_num[7]);
CSM_C block8(bo8,d8,stage12[6],q43[0],bo9,bo6,C_num[8]);
CSM_E block9(bo9,d9,stage12[5],bo10,bo6,C_num[9]);
CSM_D block10(bo10,d10,stage12[4],bo6,C_num[10]);
REGP#(3) Q2(clk, rst_n, q432, {q43,bo6}, Q_num2);
REGP#(8) R2(clk, rst_n, stage23, {d7,d8,d9,d10,stage12[3:0]}, R_num2);
REGP#(1) F2(clk, rst_n, s2, s1, F_num2); //flag_2
//stage3
CSM_B block11(bo11,stage23[7],bo12,C_num[11]);
CSM_C block12(bo12,d12,stage23[6],q432[2],bo13,bo11,C_num[12]);
CSM_C block13(bo13,d13,stage23[5],q432[1],bo14,bo11,C_num[13]);
CSM_C block14(bo14,d14,stage23[4],q432[0],bo15,bo11,C_num[14]);
CSM_E block15(bo15,d15,stage23[3],bo16,bo11,C_num[15]);
CSM_D block16(bo16,d16,stage23[2],bo11,C_num[16]);
REGP#(4) Q3(clk, rst_n, q4321, {q432,bo11}, Q_num3);
REGP#(7) R3(clk, rst_n, stage34, {d12,d13,d14,d15,d16,stage23[1:0]}, R_num3);
REGP#(1) F3(clk, rst_n, s3, s2, F_num3); //flag_3
//stage4
CSM_B block17(bo17,stage34[6],bo18,C_num[17]);
CSM_C block18(bo18,d18,stage34[5],q4321[3],bo19,bo17,C_num[18]);
CSM_C block19(bo19,d19,stage34[4],q4321[2],bo20,bo17,C_num[19]);
CSM_C block20(bo20,d20,stage34[3],q4321[1],bo21,bo17,C_num[20]);
CSM_C block21(bo21,d21,stage34[2],q4321[0],bo22,bo17,C_num[21]);
CSM_E block22(bo22,d22,stage34[1],bo23,bo17,C_num[22]);
CSM_D block23(bo23,d23,stage34[0],bo17,C_num[23]);
REGP#(5) Q4(clk, rst_n, o_root, {q4321,bo17}, Q_num4);
REGP#(1) F4(clk, rst_n, o_finish, s3, F_num4); //o_finish = 1'b1 4 clocks after reset

//sum number of transistors
reg [50:0] sum_csm;
integer j;
always @(*) begin
	sum_csm = 0;
	for (j=0; j<24; j=j+1) begin 
		sum_csm = sum_csm + C_num[j];
	end
end
assign number =  sum_csm + R_num1 + R_num2 + R_num3 + F_num1 + F_num2 + F_num3 + F_num4 + Q_num1 + Q_num2 + Q_num3 + Q_num4;

endmodule

//BW-bit FD2
module REGP#(
	parameter BW = 2
)(
	input clk,
	input rst_n,
	output [BW-1:0] Q,
	input [BW-1:0] D,
	output [50:0] number
);

wire [50:0] numbers [0:BW-1];

genvar i;
generate
	for (i=0; i<BW; i=i+1) begin
		FD2 f0(Q[i], D[i], clk, rst_n, numbers[i]);
	end
endgenerate

//sum number of transistors
reg [50:0] sum;
integer j;
always @(*) begin
	sum = 0;
	for (j=0; j<BW; j=j+1) begin 
		sum = sum + numbers[j];
	end
end

assign number = sum;

endmodule

module CSM_B(bo,a,bin,number);
    //bo = q
    input a, bin;
    output bo;
    output [50:0] number;
    wire a_bar;
    wire [50:0] num0, num1;
    IV inv0(a_bar,a,num0);
    //assign bo = ~((~a)&bin)
    ND2 nd0(bo,a_bar,bin,num1);
    //sum number of transistors
    assign number = num0 + num1;
endmodule

module CSM_C(bo,d,a,b,bin,u,number);
    //origin
    input a, b, bin, u;
    output bo, d;
    output [50:0] number;
    wire a_bar;
    wire [50:0] num0, num1, num2, num3, num4, num5, num6;
    wire o1, o2, o3, o4;
    IV inv0(a_bar,a,num0);
    //assign bo = (~a)&b | b&bin | (~a)&bin;
    ND2 nd0(o1,a_bar,b,num1);
    ND2 nd1(o2,b,bin,num2);
    ND2 nd2(o3,a_bar,bin,num3);
    ND3 nd3(bo,o1,o2,o3,num4);
    //assign d = u? a^b^bin:a;
    EO3 eo0(o4,a,b,bin,num5);
    MUX21H sel0(d,a,o4,u,num6);
    //sum number of transistors
    assign number = num0 + num1 + num2 + num3 + num4 + num5 + num6;
endmodule

module CSM_D(bo,d,a,u,number);
    //b,bin = 10
    input a, u;
    output bo, d;
    output [50:0] number;
    wire o1, o2;
    wire [50:0] num0, num1;
    //assign bo = (~a)
    IV inv0(bo,a,num0);
    //assign d = u? (~a):a
    MUX21H sel0(d,a,bo,u,num1);
    //sum number of transistors
    assign number = num0 + num1;
endmodule

module CSM_E(bo,d,a,bin,u,number);
    //b = 0
    input a, bin, u;
    output bo, d;
    output [50:0] number;
    wire a_bar;
    wire o1;
    wire [50:0] num0, num1, num2, num3;
    IV inv0(a_bar,a,num0);
    //assign bo = (~a)&bin
    AN2 an0(bo,a_bar,bin,num1);
    //assign d = u? a^bin:a
    EO eo0(o1,a,bin,num2);
    MUX21H sel0(d,a,o1,u,num3);
    //sum number of transistors
    assign number = num0 + num1 + num2 + num3;
endmodule

module CSM_F(bo,d,a,bin,u,number);
    //bo = q
    input a, bin, u;
    output bo, d;
    output [50:0] number;
    wire a_bar;
    wire o1;
    wire [50:0] num0, num1, num2, num3;
    IV inv0(a_bar,a,num0);
    //assign bo = ~((~a)&bin)
    ND2 nd0(bo,a_bar,bin,num1);
	//assign d = u? a^bin:a
    EO eo0(o1,a,bin,num2);
    MUX21H sel0(d,a,o1,u,num3);
    //sum number of transistors
    assign number = num0 + num1 + num2 + num3;
endmodule
