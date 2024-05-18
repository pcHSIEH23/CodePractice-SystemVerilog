//Write a code to generate a 9MHz square waveform for the signal sclk.
//Assume timescale with 1nsec time-unit and 3 digit precision.

//9MHz = 0.1111 * 10^(-6) = 111.111ns

`timescale 1ns/1ps
module A23_tb();
	reg clk9 = 0;
	always #55.556 clk9 = ~clk9;
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#2000
		$finish();
	end
endmodule