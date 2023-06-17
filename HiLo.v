
module HiLo( Out, clk, MulAns, Signal );
input clk ;
input[3:0] Signal ;
input[63:0] MulAns ;
output[31:0] Out ;

reg [63:0] HiLo ;

always@( posedge clk )

begin
        /*
	//if( reset )
	begin
		HiLo = 64'b0 ;
	end
	
	else
	*/
	begin
		HiLo = MulAns ;
	end
	
end
	
assign Out = ( Signal == 4'b0101 ) ? HiLo[63:32] : ( Signal == 4'b1000 ) ? HiLo[31:0] : 0 ;

endmodule