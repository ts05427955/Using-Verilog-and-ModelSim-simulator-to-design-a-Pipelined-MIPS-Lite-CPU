/*
	Title: MIPS Single Cycle CPU Testbench
	Author: Selene (Computer System and Architecture Lab, ICE, CYCU) 
*/
module tb_CPU();
	reg clk, rst;
	reg[15:0] instr_mem_array[0:46] ;
	reg[15:0] data_mem_array[0:16] ;
	reg[15:0] reg_file_array[0:100] ;
	// ���ͮɯߡA�g���G10ns
	initial begin
		clk = 1;
		forever #5 clk = ~clk;
	end

	initial begin
		rst = 1'b1;
		/*
			���O��ưO����A�ɦW"instr_mem.txt, data_mem.txt"�i�ۦ�ק�
			�C�@�欰1 Byte��ơA�H��ӤQ���i��Ʀr���
			�B��Little Endian�s�X
		*/
		/*
		$readmemh("instr_mem.txt", instr_mem_array );
		$readmemh("data_mem.txt", data_mem_array );
		// �]�w�Ȧs����l�ȡA�C�@�欰�@���Ȧs�����
		$readmemh("reg.txt", reg_file_array );
		*/
		$readmemh("instr_mem.txt", mem_array );
		$readmemh("data_mem.txt", mem_array );
		// ????????????????????
		$readmemh("reg.txt", file_array );
		#10;
		rst = 1'b0;
	end
	
	always @( posedge clk ) begin
		$display( "%d, PC:", $time/10-1, CPU.pc );
		if ( CPU.opcode == 6'd0 ) begin
			$display( "%d, wd: %d", $time/10-1, CPU.rfile_wd );
			if ( CPU.funct == 6'd32 ) $display( "%d, ADD\n", $time/10-1 );
			else if ( CPU.funct == 6'd34 ) $display( "%d, SUB\n", $time/10-1 );
			else if ( CPU.funct == 6'd36 ) $display( "%d, AND\n", $time/10-1 );
			else if ( CPU.funct == 6'd37 ) $display( "%d, OR\n", $time/10-1 );
		end
		else if ( CPU.opcode == 6'd35 ) $display( "%d, LW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd43 ) $display( "%d, SW\n", $time/10-1 );
		else if ( CPU.opcode == 6'd4 ) $display( "%d, BEQ\n", $time/10-1 );
		else if ( CPU.opcode == 6'd2 ) $display( "%d, J\n", $time/10-1 );
	end
	
	CPU CPU( clk, rst );
	
endmodule
