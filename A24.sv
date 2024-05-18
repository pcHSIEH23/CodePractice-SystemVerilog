//Write a function capable of generating a square waveform with the help of period(in nSec) and duty cycle(0 to 1).
//The phase difference is assumed to be 0 for the entire system operation.
//Verify function behavior by generating waveform for the signal clk with period: 40 nsec and duty cycle: 0.4

`timescale 1ns/1ps
module A24_tb();
	reg clk = 0; // must have clk to be reference!!!
	reg clk_ans = 0;

	always #5 clk = ~clk;

	task calc(
		output real pout,
		output real ton,
		output real toff,

		input real period,
		input real duty_circle,
		input real phase);
		pout = phase;
		ton = period * duty_circle;
		toff = period - ton;
	endtask

	task clkgen(
		input real phase,
		input real ton,
		input real toff);
		@(posedge clk);
		#phase;
		while(1)begin
			clk_ans = 1;
			#ton;
			clk_ans = 0;
			#toff;
		end
	endtask

	real phase, ton, toff;

	initial begin
		calc(phase, ton, toff, 40, 0.4, 0);
		clkgen(phase, ton, toff);
	end

	initial begin
		$dumpfile("dump.vcd");
		$dumpvars;
		#2000
		$finish();
	end
endmodule