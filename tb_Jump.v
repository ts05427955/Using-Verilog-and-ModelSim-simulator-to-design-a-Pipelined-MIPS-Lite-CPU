`timescale 1ns/1ns
module tb_Jump() ;
  reg[3:0] PC ;
  reg[25:0] OFFSET ;
  wire[31:0] NewPC ;
  
  Jump Jump( .NewPC(NewPC), .Offset(OFFSET), .PC(PC) ) ;
  
  initial 
  begin

	PC = 4'd3 ;
	OFFSET = 25'd7 ;
	#10
	PC = 4'd7 ;
	OFFSET = 25'd10 ;
	#10 ;

  end
endmodule