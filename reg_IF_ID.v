
module reg_IF_ID ( clk, PC, ins, out_PC, out_ins );

    input clk ;
    input [31:0] PC, ins ;
	
    output [31:0] out_PC, out_ins ;
	
    reg [31:0] out_PC, out_ins ;

    always @( posedge clk ) 
	begin
		out_PC <= PC ;
		out_ins <= ins ;
    end

endmodule