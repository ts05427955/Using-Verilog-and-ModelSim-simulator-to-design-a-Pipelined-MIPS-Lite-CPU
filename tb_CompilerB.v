`timescale 1ns/1ns
module tb_CompilerB ;
  reg clk ;
  reg[5:0] OP ;
  reg[31:0] RN1, RN2 ;
  wire zero ;

  CompilerB CompilerB( .zero(zero), .clk(clk), .OP(OP), .RN1(RN1), .RN2(RN2) ) ;
  parameter OP_BEQ = 6'd4 ;
  parameter OP_BNE = 6'd5 ;
  initial 
        begin
		clk = 1'b1;
		forever #10 clk = ~clk;
  end
 
  initial
	begin
	  RN1 = 32'b010 ;
	  RN2 = 32'b011 ;
	  OP = 6'd5 ;
	  #10
	  RN1 = 32'b01 ;
	  RN2 = 32'b10 ;
	  OP = 6'd4 ;
	  #10 
	  RN1 = 32'b01 ;
	  RN2 = 32'b01 ;
	  OP = 6'd4 ;
	  #10
	  RN1 = 32'b010 ;
	  RN2 = 32'b011 ;
	  OP = 6'd5 ;
	  #10 
	  RN1 = 32'b011 ;
	  RN2 = 32'b011 ;
	  OP = 6'd5 ;
	  #10 
	  RN1 = 32'b010 ;
	  RN2 = 32'b011 ;
	  OP = 6'd6 ;
	  #10
	  #10$stop ;
	end
endmodule
  

