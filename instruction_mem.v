
module InstructionMemory32(instruction, ProgramCounter, clk);
	input[31:0] ProgramCounter;
	input clk;
	output[31:0] instruction;
	reg [7:0] memory [0:1023];
	reg [31:0] instruction;
	integer addr;
	
  
	always @(posedge clk) 
	begin
		addr = ProgramCounter[31:0];
		instruction[7:0] = memory[addr];
		instruction[15:8] = memory[addr+1];
		instruction[23:16] = memory[addr+2];
		instruction[31:24] = memory[addr+3];
	end
	
endmodule