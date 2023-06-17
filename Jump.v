
module Jump( NewPC, Offset, PC, OP ) ;
	input[25:0] Offset ;
	input[31:0] PC ;
	input[5:0] OP ;
	output[31:0] NewPC ;
	
	wire[27:0] temp ;
	assign temp[27:0] = ( Offset << 2 ) ;
	assign NewPC[31:0] = ( OP == 2 ) ? ( temp + PC ) : PC ;
endmodule 