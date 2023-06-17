
module mips_processor( clk, rst );
	input clk, rst;
	
	// instruction bus
	wire[31:0] instr;

	// break out important fields from instruction
	wire [4:0] rs, rt, rd, shamt;
	wire [5:0] opcode, funct;
	wire [15:0] immed;
	wire [31:0] extend_immed, b_offset;
	wire [25:0] jumpoffset;
	
	// datapath signals
	wire [4:0] rfile_wn;
	wire [31:0] rfile_rd1, pc_next, pc, pc_incr, dmem_rdata, jump_addr, branch_addr,
	            hi, lo, hilo_out, AM_out, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt ;
	wire [63:0] mul_out ;

	// control signals
	wire MemWrite, ALUSrc, Zero, Jump, RegWrite, BranchEQ, BranchNE, PCsrc, RegDst, MemtoReg, MemRead, hilo, A_or_M, is_MUL ;
	wire [1:0] ALUOp;
	wire [2:0] Operation;

	wire ALUSrc_EX, RegDst_EX, MemRead_EX, MemWrite_EX, MemtoReg_EX, RegWrite_EX, BranchEQ_EX, BranchNE_EX, jump_EX, A_or_M_EX,
	     hilo_EX ;
	wire [1:0] ALUOp_EX;
	wire [4:0] rt_EX, rd_EX ;
	wire [5:0] funct_EX;
	wire [31:0] RD1_EX, RD2_EX, pc_incr_EX, immed_EX, jump_addr_EX, instruction_ID, pc_incr_ID ;

	wire MemRead_MEM, MemWrite_MEM, MemtoReg_MEM, RegWrite_MEM, BranchEQ_MEM, BranchNE_MEM, zero_MEM,
	     jump_MEM ;
	wire [4:0] WN_MEM ;
	wire [31:0] AM_out_MEM, b_tgt_MEM, WD_MEM, jump_addr_MEM ;

	wire MemtoReg_WB, RegWrite_WB ;
	wire [4:0] WN_WB ;
	wire [31:0] RD_WB, AM_out_WB ;

	assign funct = instruction[5:0];
	assign opcode = instruction[31:26];
	assign rd = instruction[15:11];
	assign shamt = instruction[10:6];
	assign immed = instruction[15:0];
	assign rt = instruction[20:16];
	assign jumpoffset = instruction[25:0];
	assign rs = instruction[25:21];

	// branch offset shifter
	assign b_offset = immed_EX << 2;
	
	// jump offset shifter & concatenation
	assign jump_addr = { pc_incr_ID[31:28], jumpoffset << 2 };
	// modules
	IF_ID IF_ID( .clk(clk), .rst(rst), .increment(pc_incr), .increment_Reg(pc_incr_ID), .instr(instr), .instr_Reg(instruction) );

	ID_EX ID2EX( .clk(clk), .rst(rst), .ALUsrc(ALUSrc), .ALUsrc_Reg(ALUSrc_EX), .RegDst(RegDst), .RegDst_Reg(RegDst_EX),
	             .ALUOp(ALUOp), .ALUOp_Reg(ALUOp_EX), .MemRead(MemRead), .MemRead_Reg(MemRead_EX), .MemWrite(MemWrite),
	             .MemWrite_Reg(MemWrite_EX), .MemtoReg(MemtoReg), .MemtoReg_Reg(MemtoReg_EX), .RegWrite(RegWrite),
	             .RegWrite_Reg(RegWrite_EX), .BranchEQ(BranchEQ), .BranchEQ_Reg(BranchEQ_EX), .BranchNE(BranchNE),
	             .BranchNE_Reg(BranchNE_EX), .jump(Jump), .jump_Reg(jump_EX), .rt(rt), .rt_Reg(rt_EX), .rd(rd), .rd_Reg(rd_EX),
	             .funct(funct), .funct_Reg(funct_EX), .RD1(rfile_rd1), .RD1_Reg(RD1_EX), .RD2(rfile_rd2), .RD2_Reg(RD2_EX),
	             .pc_incr(pc_incr_ID), .pc_incr_Reg(pc_incr_EX), .immed(extend_immed), .immed_Reg(immed_EX), .jump_addr(jump_addr),
	             .jump_addr_Reg(jump_addr_EX), .A_or_M(A_or_M), .A_or_M_Reg(A_or_M_EX), .hilo(hilo), .hilo_Reg(hilo_EX) );

	EX_MEM EX2MEM( .clk(clk), .rst(rst), .MemRead(MemRead_EX), .MemRead_Reg(MemRead_MEM), .MemWrite(MemWrite_EX),
	               .MemWrite_Reg(MemWrite_MEM), .MemtoReg(MemtoReg_EX), .MemtoReg_Reg(MemtoReg_MEM), .RegWrite(RegWrite_EX),
	               .RegWrite_Reg(RegWrite_MEM), .BranchEQ(BranchEQ_EX), .BranchEQ_Reg(BranchEQ_MEM), .BranchNE(BranchNE_EX),
	               .BranchNE_Reg(BranchNE_MEM), .jump(jump_EX), .jump_Reg(jump_MEM), .zero(Zero), .zero_Reg(zero_MEM),
	               .WN(rfile_wn), .WN_Reg(WN_MEM), .AM_out(AM_out), .AM_out_Reg(AM_out_MEM), .jump_addr(jump_addr_EX),
	               .jump_addr_Reg(jump_addr_MEM), .b_tgt(b_tgt), .b_tgt_Reg(b_tgt_MEM), .WD(RD2_EX), .WD_Reg(WD_MEM) );

	MEM_WB MEM2WB( .clk(clk), .rst(rst), .MemtoReg(MemtoReg_MEM), .MemtoReg_Reg(MemtoReg_WB), .RegWrite(RegWrite_MEM),
	               .RegWrite_Reg(RegWrite_WB), .WN(WN_MEM), .WN_Reg(WN_WB), .RD(dmem_rdata), .RD_Reg(RD_WB), .AM_out(AM_out_MEM),
	               .AM_out_Reg(AM_out_WB) );


	reg32 PC( .clk(clk), .rst(rst), .en_reg(1'b1), .d_in(pc_next), .d_out(pc) );

	MUX2 RtOrRd( .Condition(RegDst_EX), .inputA(rt_EX), .inputB(rd_EX), .dataOut(rfile_wn) );
	
	MUX2to1  ALUMUX( .Condition(ALUSrc_EX), .inputA(RD2_EX), .inputB(immed_EX), .dataOut(alu_b) );

	MUX2to1  HILOMUX( .Condition(hilo_EX), .inputA(lo), .inputB(hi), .dataOut(hilo_out) ) ;

	MUX2to1 ) AMMUX( .Condition(A_or_M_EX), .inputA(hilo_out), .inputB(alu_out), .dataOut(AM_out) ) ;

	MUX2to1  writeMux( .Condition(MemtoReg_WB), .inputA(AM_out_WB), .inputB(RD_WB), .dataOut(rfile_wd) );

	MUX2to1  takdBranch( .Condition(PCsrc), .inputA(pc_incr), .inputB(b_tgt_MEM), .dataOut(branch_addr) );
	
	MUX2to1  takeJump( .Condition(jump_MEM), .inputA(branch_addr), .inputB(jump_addr_MEM), .dataOut(pc_next) );
	
	sign_extend sign_extend( .immed_in(immed), .ext_immed_out(extend_immed) );
	
	PCADDFOUR pcPlus4( .inA(pc), .add_out(pc_incr) );

	add32 branchAdd( .a(pc_incr_EX), .b(b_offset), .result(b_tgt) );

	alu32 ALU( .ctl(Operation), .a(RD1_EX), .b(alu_b), .result(alu_out), .zero(Zero) );

	multiplier multiplier( .clk(clk), .rst(rst), .a(RD1_EX), .b(alu_b), .ctl(Operation), .out(mul_out) ) ;

	HiLo HiLo( .clk(clk), .rst(rst), .mul_out(mul_out), .Hi(hi), .Lo(lo) ) ;

	branch is_Branch( .BranchEQ(BranchEQ_MEM), .BranchNE(BranchNE_MEM), .Zero(zero_MEM), .PCsrc(PCsrc) ) ;


	control_single control( .clk(clk), .rst(rst), .instr(instr_ID), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg),
                            .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .BranchEQ(BranchEQ),
                            .BranchNE(BranchNE), .Jump(Jump), .ALUOp(ALUOp), .hilo(hilo), .A_or_M(A_or_M), .is_MUL(is_MUL) );

	alu_ctl ALUControl( .clk(clk), .ALUOp(ALUOp_EX), .Funct(funct_EX), .ALUOperation(Operation) );
	

	reg_file RegFile( .clk(clk), .RegWrite(RegWrite_WB), .RN1(rs), .RN2(rt), .WN(WN_WB), .WD(rfile_wd), .RD1(rfile_rd1),
	                  .RD2(rfile_rd2) );

	memory Instruction_mem( .clk(clk), .MemRead(1'b1), .MemWrite(1'b0), .wd(32'd0), .addr(pc), .rd(instr) );

	memory Data_mem( .clk(clk), .MemRead(MemRead_MEM), .MemWrite(MemWrite_MEM), .wd(WD_MEM), .addr(AM_out_MEM), .rd(dmem_rdata) );	   
				   
endmodule
