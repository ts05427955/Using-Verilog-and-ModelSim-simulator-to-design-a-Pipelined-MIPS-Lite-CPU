
module PC( dataOut, dataA, clk ) ;
  input clk ;
  input[31:0] dataA ;
  output[31:0] dataOut ;

  reg[31:0] PC_temp ;
  reg[31:0] foo ;


  always @( clk )
  begin
	PC_temp[31:0] = foo[31:0] ;
  	foo[31:0] = dataA[31:0] ;
  end
	
  assign dataOut[31:0] = PC_temp[31:0] ;
 
endmodule
