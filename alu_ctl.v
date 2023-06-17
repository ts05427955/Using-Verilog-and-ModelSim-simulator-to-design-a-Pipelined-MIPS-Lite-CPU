/*
	Title:	ALU Control Unit
	Author: Garfield (Computer System and Architecture Lab, ICE, CYCU)
	Input Port
		1. ALUOp: 控制alu是要用+還是-或是其他指令
		2. Funct: 如果是其他指令則用這邊6碼判斷
	Output Port
		1. ALUOperation: 最後解碼完成之指令
*/

module alu_ctl(ALUOp, Funct, ALUOperation);
    input [1:0] ALUOp;
    input [5:0] Funct;
    output [2:0] ALUOperation;
    reg    [2:0] ALUOperation;

    // symbolic constants for instruction function code
    parameter F_add = 6'd32;
    parameter F_sub = 6'd34;
    parameter F_and = 6'd36;
    parameter F_or  = 6'd37;
    parameter F_slt = 6'd42;
    parameter F_sll = 6'd0 ;
    parameter F_lw = 6'bx ;
    parameter F_sw = 6'bx ;
    parameter F_addiu = 6'bx ;


    // symbolic constants for ALU Operations
	parameter AND = 3'b000 ;
	parameter OR = 3'b001 ;

	parameter ADD = 3'b010 ;
	parameter SUB = 3'b110 ;

	parameter SLT = 3'b111 ;
	parameter SLL = 3'b011 ;
	parameter NOP = 3'b100 ;
    parameter LW = 3'b010 ;
    parameter SW = 3'b010 ;
    parameter ADDIU = 3'b010 ;
	
    always @(ALUOp or Funct)
    begin
        case (ALUOp) 
            2'b00 : ALUOperation = ADD;
            2'b01 : ALUOperation = SUB;
            2'b10 : case (Funct) 
                        F_add : ALUOperation = ADD;
                        F_sub : ALUOperation = SUB;
                        F_and : ALUOperation = AND;
                        F_or  : ALUOperation = OR;
                        F_slt : ALUOperation = SLT;
						F_sll : ALUOperation = SLL;

                        default ALUOperation = 3'bxxx;
                    endcase
            default ALUOperation = 3'bxxx;
        endcase
    end
endmodule

