//Assume `timescale 1ps/1ps. Generate a 25 MHz square wave waveform for the Signal clk.

`timescale 1ps/1ps
module A22_tb();
	reg clk;

	initial begin
		clk = 1'b0;
	end

	always #20 clk = ~clk; //25MHz=40ns

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
	end

	initial begin
		#200
		$finish();
	end
endmodule