
module ALU( dataOut, dataA, dataB, Signal );
	input[31:0] dataA;
	input[31:0] dataB;
	input [2:0] Signal;
	output[31:0] dataOut;
	
	wire overflow;
	wire[31:0] Binvert;
	wire[31:0] temp ;
	wire[31:0] carryIn ;
	wire[31:0] tempForSLL ;

	// Function Number
	//parameter F_AND = 6'b100100;
	//parameter F_OR  = 6'b100101;
	//parameter F_ADD = 6'b100000;
	//parameter F_SUB = 6'b100010;
	//parameter F_SLT = 6'b101010;
	//parameter F_SLL = 6'b000000;
	//parameter F_MULTU = 6'b010011;

	//Operation Number
	parameter AND = 3'b000 ;
	parameter OR = 3'b001 ;

	parameter ADD = 3'b010 ;
	parameter SUB = 3'b110 ;

	parameter SLT = 3'b111 ;
	parameter SLL = 3'b011 ;
	

	
	assign carryIn[0] = ( Signal == SUB ) ? 1 : 0;
	assign Binvert[31:0] = ( Signal == SUB ) ? ( ~dataB ) : dataB ;
	
	
	ALU1bit alu0( .CarryOut(carryIn[1]), .dataOut(temp[0]), .dataA(dataA[0]), .dataB(Binvert[0]), .CarryIn(carryIn[0]), .Signal(Signal) );
	ALU1bit alu1( .CarryOut(carryIn[2]), .dataOut(temp[1]), .dataA(dataA[1]), .dataB(Binvert[1]), .CarryIn(carryIn[1]), .Signal(Signal) );
	ALU1bit alu2( .CarryOut(carryIn[3]), .dataOut(temp[2]), .dataA(dataA[2]), .dataB(Binvert[2]), .CarryIn(carryIn[2]), .Signal(Signal) );
	ALU1bit alu3( .CarryOut(carryIn[4]), .dataOut(temp[3]), .dataA(dataA[3]), .dataB(Binvert[3]), .CarryIn(carryIn[3]), .Signal(Signal) );
	ALU1bit alu4( .CarryOut(carryIn[5]), .dataOut(temp[4]), .dataA(dataA[4]), .dataB(Binvert[4]), .CarryIn(carryIn[4]), .Signal(Signal) );
	ALU1bit alu5( .CarryOut(carryIn[6]), .dataOut(temp[5]), .dataA(dataA[5]), .dataB(Binvert[5]), .CarryIn(carryIn[5]), .Signal(Signal) );
	ALU1bit alu6( .CarryOut(carryIn[7]), .dataOut(temp[6]), .dataA(dataA[6]), .dataB(Binvert[6]), .CarryIn(carryIn[6]), .Signal(Signal) );
	ALU1bit alu7( .CarryOut(carryIn[8]), .dataOut(temp[7]), .dataA(dataA[7]), .dataB(Binvert[7]), .CarryIn(carryIn[7]), .Signal(Signal) );
	ALU1bit alu8( .CarryOut(carryIn[9]), .dataOut(temp[8]), .dataA(dataA[8]), .dataB(Binvert[8]), .CarryIn(carryIn[8]), .Signal(Signal) );
	ALU1bit alu9( .CarryOut(carryIn[10]), .dataOut(temp[9]), .dataA(dataA[9]), .dataB(Binvert[9]), .CarryIn(carryIn[9]), .Signal(Signal) );
	ALU1bit alu10( .CarryOut(carryIn[11]), .dataOut(temp[10]), .dataA(dataA[10]), .dataB(Binvert[10]), .CarryIn(carryIn[10]), .Signal(Signal) );
	ALU1bit alu11( .CarryOut(carryIn[12]), .dataOut(temp[11]), .dataA(dataA[11]), .dataB(Binvert[11]), .CarryIn(carryIn[11]), .Signal(Signal) );
	ALU1bit alu12( .CarryOut(carryIn[13]), .dataOut(temp[12]), .dataA(dataA[12]), .dataB(Binvert[12]), .CarryIn(carryIn[12]), .Signal(Signal) );
	ALU1bit alu13( .CarryOut(carryIn[14]), .dataOut(temp[13]), .dataA(dataA[13]), .dataB(Binvert[13]), .CarryIn(carryIn[13]), .Signal(Signal) );
	ALU1bit alu14( .CarryOut(carryIn[15]), .dataOut(temp[14]), .dataA(dataA[14]), .dataB(Binvert[14]), .CarryIn(carryIn[14]), .Signal(Signal) );
	ALU1bit alu15( .CarryOut(carryIn[16]), .dataOut(temp[15]), .dataA(dataA[15]), .dataB(Binvert[15]), .CarryIn(carryIn[15]), .Signal(Signal) );
	ALU1bit alu16( .CarryOut(carryIn[17]), .dataOut(temp[16]), .dataA(dataA[16]), .dataB(Binvert[16]), .CarryIn(carryIn[16]), .Signal(Signal) );
	ALU1bit alu17( .CarryOut(carryIn[18]), .dataOut(temp[17]), .dataA(dataA[17]), .dataB(Binvert[17]), .CarryIn(carryIn[17]), .Signal(Signal) );
	ALU1bit alu18( .CarryOut(carryIn[19]), .dataOut(temp[18]), .dataA(dataA[18]), .dataB(Binvert[18]), .CarryIn(carryIn[18]), .Signal(Signal) );
	ALU1bit alu19( .CarryOut(carryIn[20]), .dataOut(temp[19]), .dataA(dataA[19]), .dataB(Binvert[19]), .CarryIn(carryIn[19]), .Signal(Signal) );
	ALU1bit alu20( .CarryOut(carryIn[21]), .dataOut(temp[20]), .dataA(dataA[20]), .dataB(Binvert[20]), .CarryIn(carryIn[20]), .Signal(Signal) );
	ALU1bit alu21( .CarryOut(carryIn[22]), .dataOut(temp[21]), .dataA(dataA[21]), .dataB(Binvert[21]), .CarryIn(carryIn[21]), .Signal(Signal) );
	ALU1bit alu22( .CarryOut(carryIn[23]), .dataOut(temp[22]), .dataA(dataA[22]), .dataB(Binvert[22]), .CarryIn(carryIn[22]), .Signal(Signal) );
	ALU1bit alu23( .CarryOut(carryIn[24]), .dataOut(temp[23]), .dataA(dataA[23]), .dataB(Binvert[23]), .CarryIn(carryIn[23]), .Signal(Signal) );
	ALU1bit alu24( .CarryOut(carryIn[25]), .dataOut(temp[24]), .dataA(dataA[24]), .dataB(Binvert[24]), .CarryIn(carryIn[24]), .Signal(Signal) );
	ALU1bit alu25( .CarryOut(carryIn[26]), .dataOut(temp[25]), .dataA(dataA[25]), .dataB(Binvert[25]), .CarryIn(carryIn[25]), .Signal(Signal) );
	ALU1bit alu26( .CarryOut(carryIn[27]), .dataOut(temp[26]), .dataA(dataA[26]), .dataB(Binvert[26]), .CarryIn(carryIn[26]), .Signal(Signal) );
	ALU1bit alu27( .CarryOut(carryIn[28]), .dataOut(temp[27]), .dataA(dataA[27]), .dataB(Binvert[27]), .CarryIn(carryIn[27]), .Signal(Signal) );
	ALU1bit alu28( .CarryOut(carryIn[29]), .dataOut(temp[28]), .dataA(dataA[28]), .dataB(Binvert[28]), .CarryIn(carryIn[28]), .Signal(Signal) );
	ALU1bit alu29( .CarryOut(carryIn[30]), .dataOut(temp[29]), .dataA(dataA[29]), .dataB(Binvert[29]), .CarryIn(carryIn[29]), .Signal(Signal) );
	ALU1bit alu30( .CarryOut(carryIn[31]), .dataOut(temp[30]), .dataA(dataA[30]), .dataB(Binvert[30]), .CarryIn(carryIn[30]), .Signal(Signal) );
	ALU1bit alu31( .CarryOut(overflow), .dataOut(temp[31]), .dataA(dataA[31]), .dataB(Binvert[31]), .CarryIn(carryIn[31]), .Signal(Signal) );
		
	Shifter Shifter( .dataA(dataA[31:0]), .dataB(dataB[31:0]), .Signal(Signal[2:0]), .dataOut(tempForSLL[31:0]) ) ;    // SLL
	assign dataOut[31:0] = ( Signal == SLT ) ? ( ( dataA < dataB ) ? 1 : 0 ) : ( Signal == SLL ) ? tempForSLL[31:0] : temp[31:0] ;  // SLT
	
endmodule