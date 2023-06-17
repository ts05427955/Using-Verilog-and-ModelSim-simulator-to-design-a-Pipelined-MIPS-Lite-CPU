module reg_EX_MEM( clk, rst, MemRead, MemWrite, MemtoReg, RegWrite, 
				   ALU_out, rd2, wn, out_MemRead, out_MemWrite, 
				   out_MemtoReg, out_RegWrite, out_ALU_out, out_rd2, out_wn ) ;

    input clk, rst ;
    input MemRead, MemWrite, MemtoReg, RegWrite ; 
	input [4:0] wn ;
	input [31:0] ALU_out, rd2 ;

	output out_MemRead, out_MemWrite, out_MemtoReg, out_RegWrite; 
	output [4:0] out_wn ;
	output [31:0] out_ALU_out, out_rd2 ;
	
	reg out_MemRead, out_MemWrite, out_MemtoReg, out_RegWrite; 
	reg [4:0] out_wn ;
	reg [31:0] out_ALU_out, out_rd2 ;

   
    always @( posedge clk ) begin
        if ( rst )
		begin
			out_MemRead <= 1'bx ;
			out_MemWrite <= 1'bx ;
			out_MemtoReg <= 1'bx ;
			out_RegWrite <= 1'bx ;
			out_wn <= 5'bx ;
			out_ALU_out <= 32'bx ;
			out_rd2 <= 32'bx ;
		end
        else 
		begin
			out_MemRead <= MemRead ;
			out_MemWrite <= MemWrite ;
			out_MemtoReg <= MemtoReg ;
			out_RegWrite <= RegWrite ;
			out_wn <= wn ;
			out_ALU_out <= ALU_out ;
			out_rd2 <= rd2 ;

		end
    end

endmodule