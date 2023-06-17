`timescale 1ns/1ns
module CompilerB( zero, clk, OP, RN1, RN2 ) ;
  input clk ;
  input[5:0] OP ;
  input[31:0] RN1, RN2 ;
  output zero ;

  parameter OP_BEQ = 6'd4 ;
  parameter OP_BNE = 6'd5 ;

  reg temp = 0 ;
  //reg[63:0] SHIFTOFFSET = 64'b0 ;
  always @( clk )
  begin
	if ( OP == OP_BEQ )
        begin
	  if ( (RN1[31:0] - RN2[31:0]) == 32'b0 )
	    temp = 1 ;
	  else 
	    temp = 0 ;
	end
	else if ( OP == OP_BNE )
        begin 
	  if ( (RN1[31:0] - RN2[31:0]) != 32'b0 )
	    temp = 1 ;
	  else 
	    temp = 0 ;
	end 
        else temp = 0 ;
  end
	
  assign zero = temp ;
 
endmodule
  

