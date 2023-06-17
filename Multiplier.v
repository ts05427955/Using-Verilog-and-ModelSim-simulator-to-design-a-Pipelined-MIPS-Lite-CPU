

module Multiplier( dataOut, clk, dataA, dataB, Signal );

input clk ;
input [31:0] dataA ;
input [31:0] dataB ;
input [5:0] Signal ;

output [63:0] dataOut ;

reg[31:0]	Multiplier ;
reg[63:0]	Multiplicand ;
reg[63:0]	Product ;reg[63:0]	temp ;
reg[5:0]	count ;

parameter MULTU = 4'b0100 ;

always @( posedge clk )
begin
	//if ( reset ) count = 0 ;

		
	if ( Signal == MULTU )
	begin
	  count = count + 1 ;

      if ( count == 1 )
	    begin
	    Multiplicand = {32'b0, dataA} ;
	    Multiplier = dataB ;
	    Product = 64'b0 ;
	  end
	  
	  if ( Multiplier[0] == 1'b1 ) 
	  begin
	    Product = Product + Multiplicand ;
	  end

	  Multiplicand = Multiplicand << 1 ;
	  Multiplier = Multiplier >> 1 ;
	end 
	
	if ( count == 32 ) 
	begin
	  temp = Product ; 
	end

end

assign dataOut = temp ;

endmodule
