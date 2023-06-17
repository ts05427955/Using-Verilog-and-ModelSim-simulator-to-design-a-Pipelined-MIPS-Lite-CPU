
module BranchADD( NewPC, PC, OFFSET, ZERO ) ;
  input[31:0] PC ;
  input ZERO;
  //input Branch ;
  input[31:0] OFFSET ;
  output[31:0] NewPC ;
  
  
  assign NewPC = ( ( ZERO == 1 ) ? PC + ( OFFSET << 2 ) : PC )  ;

endmodule