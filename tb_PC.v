`timescale 1ns/1ns
module tb_PC ;
  wire[31:0] dataOut ;
  reg[31:0] inputA ;
  reg clk ;
  PC PC( .dataOut(dataOut), .dataA(inputA), .clk(clk) ) ;
  
  initial 
        begin
		clk = 1'b1;
		forever #10 clk = ~clk;
  end
  
  initial
	begin
	  inputA = 32'b01 ;
	  #10 
	  inputA = 32'b10 ;
	  #10
	  inputA = 32'b011;
	  #10 
	  inputA = 32'b0100 ;
	  #10 
	  inputA = 32'b101 ;
	  #10
	  #10$stop ;
	end
endmodule
