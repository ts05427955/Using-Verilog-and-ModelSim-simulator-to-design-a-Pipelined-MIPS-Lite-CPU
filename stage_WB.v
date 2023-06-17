

module WBStage (MEM_R_EN, memData, aluRes, WB_res);
  input MEM_R_EN;
  input [31:0] memData, aluRes;
  output [31:0] WB_res;

  assign WB_res = (MEM_R_EN) ? aluRes : memData;
endmodule // WBStage