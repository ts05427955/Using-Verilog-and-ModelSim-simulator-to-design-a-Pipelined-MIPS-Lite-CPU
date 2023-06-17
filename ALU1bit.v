
module ALU1bit( CarryOut, dataOut, dataA, dataB, CarryIn, Signal );

	input dataA, dataB, CarryIn ;
	input [2:0] Signal;
	output CarryOut, dataOut;

	wire subsign, Binvert;
	wire temp_sum, temp_CarryOut ;
	parameter AND = 3'b000 ;
	parameter OR = 3'b001 ;

	parameter ADD = 3'b010 ;
	parameter SUB = 3'b110 ;
	parameter SLT = 3'b111 ;
	/*
	parameter AND = 6'b100100;
	parameter OR  = 6'b100101;
	parameter ADD = 6'b100000;
	parameter SUB = 6'b100010;
	parameter SLT = 6'b101010;
	*/
	assign subsign = ( Signal == SUB ) ? 1 : 0; 
	
	//assign Binvert = ( subsign == 1 ) ? ( ~dataB + 1 ) : dataB ;

	FullAdder fulladder( .Sum(temp_sum), .CarryOut(temp_CarryOut), .Carryin(CarryIn), .dataA(dataA), .dataB(dataB) ) ;

	/*
	assign carryOut = ( Signal == SUB ) ? ( ( dataA | negB ) & carryIn ) | ( dataA & negB ) : 
					   ( ( dataA | dataB ) & carryIn ) | ( dataA & dataB )  ;
	*/
	assign dataOut = ( Signal == AND ) ? ( dataA & dataB ) :
		         ( Signal == OR ) ? ( dataA | dataB ) :
			 ( Signal == SLT ) ? ( dataB < dataA ? 1 : 0 ) : 
			 ( Signal == ADD ) ? temp_sum : ( Signal == SUB ) ? temp_sum : 1'b0 ;

	assign CarryOut = ( Signal == ADD ) ? temp_CarryOut : ( Signal == SUB ) ? temp_CarryOut : 1'b0 ;

endmodule