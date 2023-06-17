
module reg_ID_EX( clk, rst, ALUOp, ALUSrc, RegDst, MemRead, MemWrite, 
				  MemtoReg, RegWrite, rd1, rd2, imm, rt, rd, funct, 
				  out_ALUOp, out_ALUSrc, out_RegDst, out_MemRead, out_MemWrite, out_MemtoReg, out_RegWrite, 
				  out_rd1, out_rd2, out_imm, out_rt, out_rd, out_funct);

    input clk, rst ;
    input ALUSrc, RegDst, MemRead, MemWrite, MemtoReg, RegWrite ; 
	input [1:0] ALUOp ; 
	input [4:0] rt, rd ;
	input [5:0] funct ;
	input [31:0] rd1, rd2, imm ;
	
	output out_ALUSrc, out_RegDst, out_MemRead, out_MemWrite, out_MemtoReg, out_RegWrite ; 
	output [1:0] out_ALUOp ; 
	output [4:0] out_rt, out_rd ;
	output [5:0] out_funct ;
	output [31:0] out_rd1, out_rd2, out_imm ;
	
	reg out_ALUSrc, out_RegDst, out_MemRead, out_MemWrite, out_MemtoReg, out_RegWrite ; 
	reg [1:0] out_ALUOp ; 
	reg [4:0] out_rt, out_rd ;
	reg [5:0] out_funct ;
	reg [31:0] out_PC, out_rd1, out_rd2, out_imm ;
   
    always @( posedge clk ) begin
        if ( rst )
		begin
			out_ALUSrc <= 1'bx ;
			out_RegDst <= 1'bx ;
			out_MemRead <= 1'bx ;
			out_MemWrite <= 1'bx ;
			out_MemtoReg <= 1'bx ;
			out_RegWrite <= 1'bx ;
			out_ALUOp <= 2'bx ;
			out_rt <= 5'bx ;
			out_rd <= 5'bx ;
			out_funct <= 6'bx ;
			out_rd1 <= 32'bx ;
			out_rd2 <= 32'bx ;
			out_imm <= 32'bx ;

		end
        else
		begin
			out_ALUSrc <= ALUSrc ;
			out_RegDst <= RegDst ;
			out_MemRead <= MemRead ;
			out_MemWrite <= MemWrite ;
			out_MemtoReg <= MemtoReg ;
			out_RegWrite <= RegWrite ;
			out_ALUOp <= ALUOp ;
			out_rt <= rt ;
			out_rd <= rd ;
			out_funct <= funct ;
			out_rd1 <= rd1 ;
			out_rd2 <= rd2 ;
			out_imm <= imm ;

		end
    end

endmodule