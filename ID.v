module ID( clk, RegWrite, WN, WD, PC, INSTR, RD1, RD2, RD, RT, ALUOP, OFFSET, NewPC, MemtoReg, PCsrc, MemWrite, MemRead, ALUSrc,
			RegDst, JUMP ) ;

	input clk, RegWrite ;
	input[4:0] WN ;
	input[31:0] WD ;
	input[31:0] PC, INSTR ;
	output[4:0] RD, RT ;
	output[1:0] ALUOP ;
	output[31:0] OFFSET, NewPC, RD1, RD2 ;
	output MemtoReg, PCsrc, MemWrite, MemRead, ALUSrc, RegDst, JUMP ;
	
	wire zero, t_PCsrc, t_MemWrite, t_MemRead, t_ALUSrc, t_RegDst, t_BRANCH, t_JUMP, t_MemtoReg
        , t_RegWrite;
	wire[1:0] t_ALUOP ;
	wire[4:0] rs, rt, rd, t_WN;
	wire[5:0] op ;
	wire[15:0] immed ;
	wire[31:0] t_offset, t_NewPC, t_WD, t_RD1, t_RD2 ;
	
	/*
	assign rs = INSTR[25:21] ;
	assign rt = INSTR[20:16] ;
	assign rd = INSTR[15:11] ;
	assign immed = INSTR[15:0] ;
	assign op = INSTR[31:26] ;
	parameter J = 6'b000010;  //2
	*/

	reg_file reg_file( .clk(clk), .RegWrite(RegWrite), .RN1(INSTR[25:21]), .RN2(INSTR[20:16]), .WN(t_WN), .WD(t_WD), .RD1(t_RD1), .RD2(t_RD2) ) ;
			
	sign_extend sign_extend( .immed_in(INSTR[15:0]), .ext_immed_out(t_offset) ) ;
			
	CompilerB CompilerB( .zero(zero), .clk(clk), .OP(INSTR[31:26]), .RN1(t_RD1), .RN2(t_RD2) );
	BranchADD BranchADD( .NewPC(t_NewPC), .PC(PC), .OFFSET(t_offset), .ZERO(zero) ) ;
				

	Jump Jump( .NewPC(t_NewPC), .Offset(INSTR[25:0]), .PC(PC), .OP(INSTR[31:26]) ) ;
				
				
	control_single control_single( .opcode(INSTR[31:26]), .RegDst(RegDst), .ALUSrc(t_ALUSrc), .MemtoReg(t_MemtoReg), .RegWrite(t_RegWrite), .MemRead(t_MemRead)
	, .MemWrite(t_MemWrite), .Branch(t_BRANCH), .Jump(t_JUMP), .ALUOp(t_ALUOP)) ;
	

	
	assign RD1 = t_RD1 ;
	assign RD2 = t_RD2 ;
	assign RT = INSTR[20:16] ;
	assign RD = INSTR[15:11] ;
	assign ALUOP = t_ALUOP ;
	assign OFFSET = t_offset ;
	assign NewPC = t_NewPC ;
	assign MemtoReg = t_MemtoReg ;
	assign PCsrc = t_PCsrc ;
	assign MemWrite = t_MemWrite ;
	assign MemRead = t_MemRead ;
	assign ALUSrc = t_ALUSrc ;
	assign RegDst = t_RegDst ;
	//assign BRANCH = t_BRANCH ;
	assign JUMP = t_JUMP ;
	


endmodule