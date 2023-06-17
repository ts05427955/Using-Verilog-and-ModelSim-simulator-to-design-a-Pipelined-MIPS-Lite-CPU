module EX( clk, RT, RD, RD1, RD2, OFFSET, ALUSrc, RegDst, ALUOP, RegWrite, RTRD, MemtoReg, MemWrite, MemRead, ALUANS, WD ) ;

	output RegWrite, MemtoReg, MemWrite, MemRead ;
	output[31:0] ALUANS, WD ;
	output[4:0] RTRD ;

	
	input clk ;
	input[4:0] RT, RD ;
	input[31:0] RD1, RD2, OFFSET ;
	input ALUSrc, RegDst ;
	input[1:0] ALUOP ;
	
	wire t_MemWrite, t_MemRead, t_ALUSrc, t_RegDst, t_MemtoReg, t_RegWrite;
	wire[2:0] t_OPERATION ;
	wire[4:0] t_RTRD ;
	wire[31:0] t_offset, t_ALUANS, t_WD, t_RD1, t_RD2, t_Offset ;
	
	MUX2to1 MUX2to1( .dataOut(t_RD2), .Condition(ALUSrc), .inputA(RD2), .inputB(OFFSET) ) ;
	alu_ctl alu_ctl( .ALUOp(ALUOP), .Funct(OFFSET[5:0]), .ALUOperation(t_OPERATION) );
	ALU ALU( .dataOut(t_ALUANS), .dataA(RD1), .dataB(t_RD2), .Signal(t_OPERATION) );
	MUX2to1_5bit MUX2to1_5bit( .dataOut(t_RTRD), .Condition(RegDst), .inputA(RT), .inputB(RD) );
	
	assign RTRD = t_RTRD ;
	assign ALUANS = t_ALUANS ;
	assign WD = RD2 ;
	assign RegWrite = RegWrite ;
	assign MemRead = MemRead ;
	assign MemWrite = MemWrite ;
	assign MemtoReg = MemtoReg ;

endmodule