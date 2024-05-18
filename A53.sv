// Create a task that will generate stimulus for addr , wr, and en signal
// as mentioned in a waveform of the Instruction tab.
// Assume address is 6-bit wide while en and wr both are 1-bit wide.
// The stimulus should be sent on a positive edge of 25 MHz clock signal.

`timescale 1ns/1ns

module A53_tb();
	bit[5:0] addr;
	bit en = 1'b0;
	bit wr = 1'b0;

	reg clk = 0;
	always #20 clk=~clk; //40ns=25MHz

	task stim_addr();
		@(posedge clk);
		#10
		addr = $urandom();
	endtask

	task stim_en();
		@(posedge clk)
		#20
		wr = $urandom();
	endtask

	task stim_wr();
		@(posedge clk)
		#40
		en = $urandom();
	endtask

	initial begin
		for(int i=0;i<6;i++)begin
			stim_en();
			stim_wr();
			stim_addr();
		end
	end

	initial begin
		#1000;
		$finish();
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end
endmodule