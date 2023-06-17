
module CPU( clk, rst );
    input clk, rst ;
    wire[31:0] instr ;
    wire [5:0] opcode, funct;
    wire [4:0] rs, rt, rd, shamt, t_RTRD;
    wire [15:0] immed;
    wire [31:0] extend_immed, b_offset;
    wire [25:0] jumpoffset;
	
    wire [4:0] rfile_wn;
    wire [31:0] rfile_rd1, rfile_rd2, rfile_wd, alu_b, alu_out, b_tgt, pc_next,
                pc, pc_incr, dmem_rdata, jump_addr, branch_addr, t_WD, WB_rdata ;
	
	wire[31:0] id_pc, id_ins, ex_WD, mem_WD, MEM_ANS, WB_ANS ;
	wire[31:0] NewPC ;
	wire RegWrite, Branch, PCSrc, RegDst, MemtoReg, MemRead, MemWrite, ALUSrc, Zero, Jump;
    wire [1:0] ALUOp;
    wire [2:0] Operation;
	
	assign opcode = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];
    assign funct = instr[5:0];
    assign immed = instr[15:0];
    assign jumpoffset = instr[25:0];
	
	IFStage IFStage ( .clk(clk), .rst(rst), .brTaken(Branch), .jumpTaken(Jump), .NewPC(pc), .adderOut(pc), .instruction(instr) );
	
	reg_IF_ID IFtoID( .clk(clk), .PC(pc), .ins(instr), .out_PC(id_pc), .out_ins(id_ins) );
	
	ID ID( .clk(clk), .RegWrite(RegWrite), .WN(rfile_wn), .WD(rfile_wd), .PC(pc), .INSTR(id_ins), .RD1(rfile_rd1), .RD2(rfile_rd2),
		   .RD(rd), .RT(rt), .ALUOP(ALUOp), .OFFSET(extend_immed), .NewPC(NewPC), .MemtoReg(MemtoReg), .PCsrc(Branch), .MemWrite(MemWrite), .MemRead(MemRead),
		   .ALUSrc(ALUSrc), .RegDst(RegDst), .JUMP(Jump) ) ;
	
	reg_ID_EX IDtoEX( .clk(clk), .rst(rst), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .RegDst(RegDst), .MemRead(MemRead), .MemWrite(MemWrite), 
					  .MemtoReg(MemtoReg), .RegWrite(RegWrite), .rd1(rfile_rd1), .rd2(rfile_rd2), .imm(extend_immed), .rt(rt), .rd(rd), .funct(extend_immed[5:0]), 
					  .out_ALUOp(ALUOp), .out_ALUSrc(ALUSrc), .out_RegDst(RegDst), .out_MemRead(MemRead), .out_MemWrite(MemWrite), .out_MemtoReg(MemtoReg), .out_RegWrite(RegWrite), 
					  .out_rd1(rfile_rd1), .out_rd2(rfile_rd2), .out_imm(extend_immed), .out_rt(rt), .out_rd(rd), .out_funct(funct) );
					  
	EX EX( .clk(clk), .RT(rt), .RD(rd), .RD1(rfile_rd1), .RD2(rfile_rd2), .OFFSET(extend_immed), .ALUSrc(ALUSrc), .RegDst(RegDst), .ALUOP(ALUOp), .RegWrite(RegWrite),
		   .RTRD(t_RTRD), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .MemRead(MemRead), .ALUANS(alu_out), .WD(ex_WD) ) ;


	reg_EX_MEM EXtoMEM( .clk(clk), .rst(rst), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .RegWrite(RegWrite), 
						.ALU_out(alu_out), .rd2(ex_WD), .wn(t_RTRD), .out_MemRead(MemRead), .out_MemWrite(MemWrite), 
						.out_MemtoReg(MemtoReg), .out_RegWrite(RegWrite), .out_ALU_out(alu_out), .out_rd2(mem_WD), .out_wn(t_RTRD) ) ;
				   
	MEMStage MEMStage( .clk(clk), .MemRead(MemRead), .MemWrite(MemWrite), .addr(alu_out), .ST_value(mem_WD), .dataMem_out(dmem_rdata), .ALU_OUT(MEM_ANS) );
	
	reg_MEM_WB MEMtoWB( .clk(clk), .rst(rst), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .rd(dmem_rdata), .ALU_out(MEM_ANS), .wn(t_RTRD), 
						.out_MemtoReg(MemtoReg), .out_RegWrite(RegWrite), .out_rd(WB_rdata), .out_ALU_out(WB_ANS), .out_wn(rfile_wn) ) ;
						
	WBStage WBStage( .MEM_R_EN(MemtoReg), .memData(WB_rdata), .aluRes(WB_ANS), .WB_res(rfile_wd) );
				   
endmodule