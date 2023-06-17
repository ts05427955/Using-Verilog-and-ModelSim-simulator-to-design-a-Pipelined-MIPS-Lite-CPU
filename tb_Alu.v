`timescale 1ns/ 1ns
module tb_alv ;
	wire[31:0] SumOut;
	reg[31:0] inputA ;
	reg[31:0] inputB ;
	reg[2:0] Signal ;
	ALU ALU( .dataOut(SumOut), .dataA(inputA), .dataB(inputB), .Signal(Signal) ) ;
	initial
	begin
		inputA = 32'b000100 ;
		inputB = 32'b111100 ;
		Signal = 3'b000 ; //And
		#100
		inputA = 32'b000100 ;
		inputB = 32'b100100 ;
		Signal = 3'b001 ; //Or
		#100 
		inputA = 32'b000011 ;
		inputB = 32'b001111 ;
		Signal = 3'b010 ; //Add
		#100 
		inputA = 32'b010000 ;
		inputB = 32'b000100 ;
		Signal = 3'b110 ; //Sub
		#100 
		inputA = 32'b000011 ;
		inputB = 32'b001000 ;
		Signal = 3'b110 ; //Sub
		#100 
		inputA = 32'b000011 ;
		inputB = 32'b001000 ;
		Signal = 3'b111 ; //Slt
		#100
		inputA = 32'b000011 ;
		inputB = 32'b000100 ;
		Signal = 3'b011 ; //SLL
		#100 $stop ;
	end
	
endmodule