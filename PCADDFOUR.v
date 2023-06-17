module PCADDFOUR (inA, add_out);
	input [31:0] inA;
	output [31:0] add_out;
	assign add_out=inA+ 32'h00000004;
endmodule