
module MUX2to1_5bit( dataOut, Condition, inputA, inputB );
	input Condition ;
	input[4:0] inputA, inputB ;
	output[4:0] dataOut ;
	
	assign dataOut = ( Condition == 0 ) ? inputA : inputB ;
endmodule