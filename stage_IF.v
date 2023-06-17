module IFStage (clk, rst, brTaken, jumpTaken, NewPC, adderOut, instruction );
  input clk, rst, brTaken, jumpTaken ;
  input [31:0] NewPC;
  output [31:0] adderOut, instruction;

  wire [31:0] branchOut, jumpOut, pcOut;
  wire[31:0] t_BPC, t_JUMP, t_PC ;

  MUX2to1 PCSrc ( .inputA(adderOut), .inputB(NewPC), .Condition(brTaken), .dataOut(t_BPC) );

  MUX2to1 jump ( .inputA(branchOut), .inputB(NewPC), .Condition(jumpTaken), .dataOut(t_JUMP) );

  PCADDFOUR add4 ( .inA(t_PC), .add_out(adderOut) );

  assign t_PC = ( brTaken == 0 ) ? ( ( jumpTaken == 0 ) ? t_PC : t_JUMP ) : t_BPC ;  

  reg32 programCounter ( .clk(clk), .rst(rst), .d_in(t_PC), .d_out(pcOut) );

  InstructionMemory32 instructions ( .clk(clk), .ProgramCounter(pcOut), .instruction(instruction) );

 
endmodule // IFStage