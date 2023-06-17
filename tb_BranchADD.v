`timescale 1ns/1ns
module tb_BranchADD() ;
  reg[31:0] PC ;
  reg[31:0] OFFSET ;
  wire[31:0] NewPC ;
  
  BranchADD BranchADD( .NewPC(NewPC), .PC(PC), .OFFSET(OFFSET) ) ;
  
  initial 
  begin

	PC = 32'd4 ;
	OFFSET = 32'd7 ;
	#10
	PC = 32'd7 ;
	OFFSET = 32'd10 ;
	#10 ;

  end
endmodule