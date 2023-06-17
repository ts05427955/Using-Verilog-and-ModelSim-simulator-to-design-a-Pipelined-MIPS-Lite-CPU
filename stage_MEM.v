

module MEMStage (clk, MemRead, MemWrite, addr, ST_value, dataMem_out, ALU_OUT );
  input clk, MemRead, MemWrite;
  input [31:0] addr, ST_value;
  output [31:0]  dataMem_out, ALU_OUT;

  memory dataMem (
    .clk(clk),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .addr(addr),
    .wd(ST_value),
    .rd(dataMem_out)
  );
  
  assign ALU_OUT = addr ;

endmodule // MEMStage