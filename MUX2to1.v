
module MUX2to1( dataOut, Condition, inputA, inputB );
	input Condition ;
	input[31:0] inputA, inputB ;
	output[31:0] dataOut ;
	
	assign dataOut = ( Condition == 0 ) ? inputA : inputB ;
endmodule