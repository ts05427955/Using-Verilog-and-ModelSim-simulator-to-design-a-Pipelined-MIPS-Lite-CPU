
module Shifter( dataA, dataB, Signal, dataOut );
input [31:0] dataA ;
input [31:0] dataB ;
input [2:0] Signal ;
output [31:0] dataOut ;


wire [31:0] tmp0, tmp1, tmp2, tmp3, tmp4 ;

parameter SLL = 3'b011 ;

//16bit shift left
mux2X1  mux_16bit_31 (.in0(dataA[31]),.in1(dataA[15]),.sel(dataB[4]),.out(tmp4[31]));
mux2X1  mux_16bit_30 (.in0(dataA[30]),.in1(dataA[14]),.sel(dataB[4]),.out(tmp4[30]));
mux2X1  mux_16bit_29 (.in0(dataA[29]),.in1(dataA[13]),.sel(dataB[4]),.out(tmp4[29]));
mux2X1  mux_16bit_28 (.in0(dataA[28]),.in1(dataA[12]),.sel(dataB[4]),.out(tmp4[28]));
mux2X1  mux_16bit_27 (.in0(dataA[27]),.in1(dataA[11]),.sel(dataB[4]),.out(tmp4[27]));
mux2X1  mux_16bit_26 (.in0(dataA[26]),.in1(dataA[10]),.sel(dataB[4]),.out(tmp4[26]));
mux2X1  mux_16bit_25 (.in0(dataA[25]),.in1(dataA[9]),.sel(dataB[4]),.out(tmp4[25]));
mux2X1  mux_16bit_24 (.in0(dataA[24]),.in1(dataA[8]),.sel(dataB[4]),.out(tmp4[24]));
mux2X1  mux_16bit_23 (.in0(dataA[23]),.in1(dataA[7]),.sel(dataB[4]),.out(tmp4[23]));
mux2X1  mux_16bit_22 (.in0(dataA[22]),.in1(dataA[6]),.sel(dataB[4]),.out(tmp4[22]));
mux2X1  mux_16bit_21 (.in0(dataA[21]),.in1(dataA[5]),.sel(dataB[4]),.out(tmp4[21]));
mux2X1  mux_16bit_20 (.in0(dataA[20]),.in1(dataA[4]),.sel(dataB[4]),.out(tmp4[20]));
mux2X1  mux_16bit_19 (.in0(dataA[19]),.in1(dataA[3]),.sel(dataB[4]),.out(tmp4[19]));
mux2X1  mux_16bit_18 (.in0(dataA[18]),.in1(dataA[2]),.sel(dataB[4]),.out(tmp4[18]));
mux2X1  mux_16bit_17 (.in0(dataA[17]),.in1(dataA[1]),.sel(dataB[4]),.out(tmp4[17]));
mux2X1  mux_16bit_16 (.in0(dataA[16]),.in1(dataA[0]),.sel(dataB[4]),.out(tmp4[16]));
mux2X1  mux_16bit_15 (.in0(dataA[15]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[15]));
mux2X1  mux_16bit_14 (.in0(dataA[14]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[14]));
mux2X1  mux_16bit_13 (.in0(dataA[13]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[13]));
mux2X1  mux_16bit_12 (.in0(dataA[12]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[12]));
mux2X1  mux_16bit_11 (.in0(dataA[11]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[11]));
mux2X1  mux_16bit_10 (.in0(dataA[10]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[10]));
mux2X1  mux_16bit_9 (.in0(dataA[9]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[9]));
mux2X1  mux_16bit_8 (.in0(dataA[8]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[8]));
mux2X1  mux_16bit_7 (.in0(dataA[7]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[7]));
mux2X1  mux_16bit_6 (.in0(dataA[6]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[6]));
mux2X1  mux_16bit_5 (.in0(dataA[5]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[5]));
mux2X1  mux_16bit_4 (.in0(dataA[4]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[4]));
mux2X1  mux_16bit_3 (.in0(dataA[3]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[3]));
mux2X1  mux_16bit_2 (.in0(dataA[2]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[2]));
mux2X1  mux_16bit_1 (.in0(dataA[1]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[1]));
mux2X1  mux_16bit_0 (.in0(dataA[0]),.in1(1'b0),.sel(dataB[4]),.out(tmp4[0]));


//8bit shift left
mux2X1  mux_8bit_31 (.in0(tmp4[31]),.in1(tmp4[23]),.sel(dataB[3]),.out(tmp3[31]));
mux2X1  mux_8bit_30 (.in0(tmp4[30]),.in1(tmp4[22]),.sel(dataB[3]),.out(tmp3[30]));
mux2X1  mux_8bit_29 (.in0(tmp4[29]),.in1(tmp4[21]),.sel(dataB[3]),.out(tmp3[29]));
mux2X1  mux_8bit_28 (.in0(tmp4[28]),.in1(tmp4[20]),.sel(dataB[3]),.out(tmp3[28]));
mux2X1  mux_8bit_27 (.in0(tmp4[27]),.in1(tmp4[19]),.sel(dataB[3]),.out(tmp3[27]));
mux2X1  mux_8bit_26 (.in0(tmp4[26]),.in1(tmp4[18]),.sel(dataB[3]),.out(tmp3[26]));
mux2X1  mux_8bit_25 (.in0(tmp4[25]),.in1(tmp4[17]),.sel(dataB[3]),.out(tmp3[25]));
mux2X1  mux_8bit_24 (.in0(tmp4[24]),.in1(tmp4[16]),.sel(dataB[3]),.out(tmp3[24]));
mux2X1  mux_8bit_23 (.in0(tmp4[23]),.in1(tmp4[15]),.sel(dataB[3]),.out(tmp3[23]));
mux2X1  mux_8bit_22 (.in0(tmp4[22]),.in1(tmp4[14]),.sel(dataB[3]),.out(tmp3[22]));
mux2X1  mux_8bit_21 (.in0(tmp4[21]),.in1(tmp4[13]),.sel(dataB[3]),.out(tmp3[21]));
mux2X1  mux_8bit_20 (.in0(tmp4[20]),.in1(tmp4[12]),.sel(dataB[3]),.out(tmp3[20]));
mux2X1  mux_8bit_19 (.in0(tmp4[19]),.in1(tmp4[11]),.sel(dataB[3]),.out(tmp3[19]));
mux2X1  mux_8bit_18 (.in0(tmp4[18]),.in1(tmp4[10]),.sel(dataB[3]),.out(tmp3[18]));
mux2X1  mux_8bit_17 (.in0(tmp4[17]),.in1(tmp4[9]),.sel(dataB[3]),.out(tmp3[17]));
mux2X1  mux_8bit_16 (.in0(tmp4[16]),.in1(tmp4[8]),.sel(dataB[3]),.out(tmp3[16]));
mux2X1  mux_8bit_15 (.in0(tmp4[15]),.in1(tmp4[7]),.sel(dataB[3]),.out(tmp3[15]));
mux2X1  mux_8bit_14 (.in0(tmp4[14]),.in1(tmp4[6]),.sel(dataB[3]),.out(tmp3[14]));
mux2X1  mux_8bit_13 (.in0(tmp4[13]),.in1(tmp4[5]),.sel(dataB[3]),.out(tmp3[13]));
mux2X1  mux_8bit_12 (.in0(tmp4[12]),.in1(tmp4[4]),.sel(dataB[3]),.out(tmp3[12]));
mux2X1  mux_8bit_11 (.in0(tmp4[11]),.in1(tmp4[3]),.sel(dataB[3]),.out(tmp3[11]));
mux2X1  mux_8bit_10 (.in0(tmp4[10]),.in1(tmp4[2]),.sel(dataB[3]),.out(tmp3[10]));
mux2X1  mux_8bit_9 (.in0(tmp4[9]),.in1(tmp4[1]),.sel(dataB[3]),.out(tmp3[9]));
mux2X1  mux_8bit_8 (.in0(tmp4[8]),.in1(tmp4[0]),.sel(dataB[3]),.out(tmp3[8]));
mux2X1  mux_8bit_7 (.in0(tmp4[7]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[7]));
mux2X1  mux_8bit_6 (.in0(tmp4[6]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[6]));
mux2X1  mux_8bit_5 (.in0(tmp4[5]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[5]));
mux2X1  mux_8bit_4 (.in0(tmp4[4]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[4]));
mux2X1  mux_8bit_3 (.in0(tmp4[3]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[3]));
mux2X1  mux_8bit_2 (.in0(tmp4[2]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[2]));
mux2X1  mux_8bit_1 (.in0(tmp4[1]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[1]));
mux2X1  mux_8bit_0 (.in0(tmp4[0]),.in1(1'b0),.sel(dataB[3]),.out(tmp3[0]));


//4bit shift left
mux2X1  mux_4bit_31 (.in0(tmp3[31]),.in1(tmp3[27]),.sel(dataB[2]),.out(tmp2[31]));
mux2X1  mux_4bit_30 (.in0(tmp3[30]),.in1(tmp3[26]),.sel(dataB[2]),.out(tmp2[30]));
mux2X1  mux_4bit_29 (.in0(tmp3[29]),.in1(tmp3[25]),.sel(dataB[2]),.out(tmp2[29]));
mux2X1  mux_4bit_28 (.in0(tmp3[28]),.in1(tmp3[24]),.sel(dataB[2]),.out(tmp2[28]));
mux2X1  mux_4bit_27 (.in0(tmp3[27]),.in1(tmp3[23]),.sel(dataB[2]),.out(tmp2[27]));
mux2X1  mux_4bit_26 (.in0(tmp3[26]),.in1(tmp3[22]),.sel(dataB[2]),.out(tmp2[26]));
mux2X1  mux_4bit_25 (.in0(tmp3[25]),.in1(tmp3[21]),.sel(dataB[2]),.out(tmp2[25]));
mux2X1  mux_4bit_24 (.in0(tmp3[24]),.in1(tmp3[20]),.sel(dataB[2]),.out(tmp2[24]));
mux2X1  mux_4bit_23 (.in0(tmp3[23]),.in1(tmp3[19]),.sel(dataB[2]),.out(tmp2[23]));
mux2X1  mux_4bit_22 (.in0(tmp3[22]),.in1(tmp3[18]),.sel(dataB[2]),.out(tmp2[22]));
mux2X1  mux_4bit_21 (.in0(tmp3[21]),.in1(tmp3[17]),.sel(dataB[2]),.out(tmp2[21]));
mux2X1  mux_4bit_20 (.in0(tmp3[20]),.in1(tmp3[16]),.sel(dataB[2]),.out(tmp2[20]));
mux2X1  mux_4bit_19 (.in0(tmp3[19]),.in1(tmp3[15]),.sel(dataB[2]),.out(tmp2[19]));
mux2X1  mux_4bit_18 (.in0(tmp3[18]),.in1(tmp3[14]),.sel(dataB[2]),.out(tmp2[18]));
mux2X1  mux_4bit_17 (.in0(tmp3[17]),.in1(tmp3[13]),.sel(dataB[2]),.out(tmp2[17]));
mux2X1  mux_4bit_16 (.in0(tmp3[16]),.in1(tmp3[12]),.sel(dataB[2]),.out(tmp2[16]));
mux2X1  mux_4bit_15 (.in0(tmp3[15]),.in1(tmp3[11]),.sel(dataB[2]),.out(tmp2[15]));
mux2X1  mux_4bit_14 (.in0(tmp3[14]),.in1(tmp3[10]),.sel(dataB[2]),.out(tmp2[14]));
mux2X1  mux_4bit_13 (.in0(tmp3[13]),.in1(tmp3[9]),.sel(dataB[2]),.out(tmp2[13]));
mux2X1  mux_4bit_12 (.in0(tmp3[12]),.in1(tmp3[8]),.sel(dataB[2]),.out(tmp2[12]));
mux2X1  mux_4bit_11 (.in0(tmp3[11]),.in1(tmp3[7]),.sel(dataB[2]),.out(tmp2[11]));
mux2X1  mux_4bit_10 (.in0(tmp3[10]),.in1(tmp3[6]),.sel(dataB[2]),.out(tmp2[10]));
mux2X1  mux_4bit_9 (.in0(tmp3[9]),.in1(tmp3[5]),.sel(dataB[2]),.out(tmp2[9]));
mux2X1  mux_4bit_8 (.in0(tmp3[8]),.in1(tmp3[4]),.sel(dataB[2]),.out(tmp2[8]));
mux2X1  mux_4bit_7 (.in0(tmp3[7]),.in1(tmp3[3]),.sel(dataB[2]),.out(tmp2[7]));
mux2X1  mux_4bit_6 (.in0(tmp3[6]),.in1(tmp3[2]),.sel(dataB[2]),.out(tmp2[6]));
mux2X1  mux_4bit_5 (.in0(tmp3[5]),.in1(tmp3[1]),.sel(dataB[2]),.out(tmp2[5]));
mux2X1  mux_4bit_4 (.in0(tmp3[4]),.in1(tmp3[0]),.sel(dataB[2]),.out(tmp2[4]));
mux2X1  mux_4bit_3 (.in0(tmp3[3]),.in1(1'b0),.sel(dataB[2]),.out(tmp2[3]));
mux2X1  mux_4bit_2 (.in0(tmp3[2]),.in1(1'b0),.sel(dataB[2]),.out(tmp2[2]));
mux2X1  mux_4bit_1 (.in0(tmp3[1]),.in1(1'b0),.sel(dataB[2]),.out(tmp2[1]));
mux2X1  mux_4bit_0 (.in0(tmp3[0]),.in1(1'b0),.sel(dataB[2]),.out(tmp2[0]));


//2bit shift left
mux2X1  mux_2bit_31 (.in0(tmp2[31]),.in1(tmp2[29]),.sel(dataB[1]),.out(tmp1[31]));
mux2X1  mux_2bit_30 (.in0(tmp2[30]),.in1(tmp2[28]),.sel(dataB[1]),.out(tmp1[30]));
mux2X1  mux_2bit_29 (.in0(tmp2[29]),.in1(tmp2[27]),.sel(dataB[1]),.out(tmp1[29]));
mux2X1  mux_2bit_28 (.in0(tmp2[28]),.in1(tmp2[26]),.sel(dataB[1]),.out(tmp1[28]));
mux2X1  mux_2bit_27 (.in0(tmp2[27]),.in1(tmp2[25]),.sel(dataB[1]),.out(tmp1[27]));
mux2X1  mux_2bit_26 (.in0(tmp2[26]),.in1(tmp2[24]),.sel(dataB[1]),.out(tmp1[26]));
mux2X1  mux_2bit_25 (.in0(tmp2[25]),.in1(tmp2[23]),.sel(dataB[1]),.out(tmp1[25]));
mux2X1  mux_2bit_24 (.in0(tmp2[24]),.in1(tmp2[22]),.sel(dataB[1]),.out(tmp1[24]));
mux2X1  mux_2bit_23 (.in0(tmp2[23]),.in1(tmp2[21]),.sel(dataB[1]),.out(tmp1[23]));
mux2X1  mux_2bit_22 (.in0(tmp2[22]),.in1(tmp2[20]),.sel(dataB[1]),.out(tmp1[22]));
mux2X1  mux_2bit_21 (.in0(tmp2[21]),.in1(tmp2[19]),.sel(dataB[1]),.out(tmp1[21]));
mux2X1  mux_2bit_20 (.in0(tmp2[20]),.in1(tmp2[18]),.sel(dataB[1]),.out(tmp1[20]));
mux2X1  mux_2bit_19 (.in0(tmp2[19]),.in1(tmp2[17]),.sel(dataB[1]),.out(tmp1[19]));
mux2X1  mux_2bit_18 (.in0(tmp2[18]),.in1(tmp2[16]),.sel(dataB[1]),.out(tmp1[18]));
mux2X1  mux_2bit_17 (.in0(tmp2[17]),.in1(tmp2[15]),.sel(dataB[1]),.out(tmp1[17]));
mux2X1  mux_2bit_16 (.in0(tmp2[16]),.in1(tmp2[14]),.sel(dataB[1]),.out(tmp1[16]));
mux2X1  mux_2bit_15 (.in0(tmp2[15]),.in1(tmp2[13]),.sel(dataB[1]),.out(tmp1[15]));
mux2X1  mux_2bit_14 (.in0(tmp2[14]),.in1(tmp2[12]),.sel(dataB[1]),.out(tmp1[14]));
mux2X1  mux_2bit_13 (.in0(tmp2[13]),.in1(tmp2[11]),.sel(dataB[1]),.out(tmp1[13]));
mux2X1  mux_2bit_12 (.in0(tmp2[12]),.in1(tmp2[10]),.sel(dataB[1]),.out(tmp1[12]));
mux2X1  mux_2bit_11 (.in0(tmp2[11]),.in1(tmp2[9]),.sel(dataB[1]),.out(tmp1[11]));
mux2X1  mux_2bit_10 (.in0(tmp2[10]),.in1(tmp2[8]),.sel(dataB[1]),.out(tmp1[10]));
mux2X1  mux_2bit_9 (.in0(tmp2[9]),.in1(tmp2[7]),.sel(dataB[1]),.out(tmp1[9]));
mux2X1  mux_2bit_8 (.in0(tmp2[8]),.in1(tmp2[6]),.sel(dataB[1]),.out(tmp1[8]));
mux2X1  mux_2bit_7 (.in0(tmp2[7]),.in1(tmp2[5]),.sel(dataB[1]),.out(tmp1[7]));
mux2X1  mux_2bit_6 (.in0(tmp2[6]),.in1(tmp2[4]),.sel(dataB[1]),.out(tmp1[6]));
mux2X1  mux_2bit_5 (.in0(tmp2[5]),.in1(tmp2[3]),.sel(dataB[1]),.out(tmp1[5]));
mux2X1  mux_2bit_4 (.in0(tmp2[4]),.in1(tmp2[2]),.sel(dataB[1]),.out(tmp1[4]));
mux2X1  mux_2bit_3 (.in0(tmp2[3]),.in1(tmp2[1]),.sel(dataB[1]),.out(tmp1[3]));
mux2X1  mux_2bit_2 (.in0(tmp2[2]),.in1(tmp2[0]),.sel(dataB[1]),.out(tmp1[2]));
mux2X1  mux_2bit_1 (.in0(tmp2[1]),.in1(1'b0),.sel(dataB[1]),.out(tmp1[1]));
mux2X1  mux_2bit_0 (.in0(tmp2[0]),.in1(1'b0),.sel(dataB[1]),.out(tmp1[0]));


//1bit shift left
mux2X1  mux_1bit_31 (.in0(tmp1[31]),.in1(tmp1[30]),.sel(dataB[0]),.out(tmp0[31]));
mux2X1  mux_1bit_30 (.in0(tmp1[30]),.in1(tmp1[29]),.sel(dataB[0]),.out(tmp0[30]));
mux2X1  mux_1bit_29 (.in0(tmp1[29]),.in1(tmp1[28]),.sel(dataB[0]),.out(tmp0[29]));
mux2X1  mux_1bit_28 (.in0(tmp1[28]),.in1(tmp1[27]),.sel(dataB[0]),.out(tmp0[28]));
mux2X1  mux_1bit_27 (.in0(tmp1[27]),.in1(tmp1[26]),.sel(dataB[0]),.out(tmp0[27]));
mux2X1  mux_1bit_26 (.in0(tmp1[26]),.in1(tmp1[25]),.sel(dataB[0]),.out(tmp0[26]));
mux2X1  mux_1bit_25 (.in0(tmp1[25]),.in1(tmp1[24]),.sel(dataB[0]),.out(tmp0[25]));
mux2X1  mux_1bit_24 (.in0(tmp1[24]),.in1(tmp1[23]),.sel(dataB[0]),.out(tmp0[24]));
mux2X1  mux_1bit_23 (.in0(tmp1[23]),.in1(tmp1[22]),.sel(dataB[0]),.out(tmp0[23]));
mux2X1  mux_1bit_22 (.in0(tmp1[22]),.in1(tmp1[21]),.sel(dataB[0]),.out(tmp0[22]));
mux2X1  mux_1bit_21 (.in0(tmp1[21]),.in1(tmp1[20]),.sel(dataB[0]),.out(tmp0[21]));
mux2X1  mux_1bit_20 (.in0(tmp1[20]),.in1(tmp1[19]),.sel(dataB[0]),.out(tmp0[20]));
mux2X1  mux_1bit_19 (.in0(tmp1[19]),.in1(tmp1[18]),.sel(dataB[0]),.out(tmp0[19]));
mux2X1  mux_1bit_18 (.in0(tmp1[18]),.in1(tmp1[17]),.sel(dataB[0]),.out(tmp0[18]));
mux2X1  mux_1bit_17 (.in0(tmp1[17]),.in1(tmp1[16]),.sel(dataB[0]),.out(tmp0[17]));
mux2X1  mux_1bit_16 (.in0(tmp1[16]),.in1(tmp1[15]),.sel(dataB[0]),.out(tmp0[16]));
mux2X1  mux_1bit_15 (.in0(tmp1[15]),.in1(tmp1[14]),.sel(dataB[0]),.out(tmp0[15]));
mux2X1  mux_1bit_14 (.in0(tmp1[14]),.in1(tmp1[13]),.sel(dataB[0]),.out(tmp0[14]));
mux2X1  mux_1bit_13 (.in0(tmp1[13]),.in1(tmp1[12]),.sel(dataB[0]),.out(tmp0[13]));
mux2X1  mux_1bit_12 (.in0(tmp1[12]),.in1(tmp1[11]),.sel(dataB[0]),.out(tmp0[12]));
mux2X1  mux_1bit_11 (.in0(tmp1[11]),.in1(tmp1[10]),.sel(dataB[0]),.out(tmp0[11]));
mux2X1  mux_1bit_10 (.in0(tmp1[10]),.in1(tmp1[9]),.sel(dataB[0]),.out(tmp0[10]));
mux2X1  mux_1bit_9 (.in0(tmp1[9]),.in1(tmp1[8]),.sel(dataB[0]),.out(tmp0[9]));
mux2X1  mux_1bit_8 (.in0(tmp1[8]),.in1(tmp1[7]),.sel(dataB[0]),.out(tmp0[8]));
mux2X1  mux_1bit_7 (.in0(tmp1[7]),.in1(tmp1[6]),.sel(dataB[0]),.out(tmp0[7]));
mux2X1  mux_1bit_6 (.in0(tmp1[6]),.in1(tmp1[5]),.sel(dataB[0]),.out(tmp0[6]));
mux2X1  mux_1bit_5 (.in0(tmp1[5]),.in1(tmp1[4]),.sel(dataB[0]),.out(tmp0[5]));
mux2X1  mux_1bit_4 (.in0(tmp1[4]),.in1(tmp1[3]),.sel(dataB[0]),.out(tmp0[4]));
mux2X1  mux_1bit_3 (.in0(tmp1[3]),.in1(tmp1[2]),.sel(dataB[0]),.out(tmp0[3]));
mux2X1  mux_1bit_2 (.in0(tmp1[2]),.in1(tmp1[1]),.sel(dataB[0]),.out(tmp0[2]));
mux2X1  mux_1bit_1 (.in0(tmp1[1]),.in1(tmp1[0]),.sel(dataB[0]),.out(tmp0[1]));
mux2X1  mux_1bit_0 (.in0(tmp1[0]),.in1(1'b0),.sel(dataB[0]),.out(tmp0[0]));



assign dataOut = (Signal == SLL) ? tmp0 : 32'b0 ;
endmodule

//2X1Mux

 
module mux2X1( in0,in1,sel,out);
input in0,in1;
input sel;
output out;
assign out=(sel)?in1:in0;
endmodule