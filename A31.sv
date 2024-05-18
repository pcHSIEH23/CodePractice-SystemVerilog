//Assume you have four variables(a,b,c,d)in your testbench top.
//a and b are of the 8-bit reg type, while c and d are of the integer type.
//Initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively.
//Add a code to print the values of all the variables after 12 nSec.

`timescale 1ns/1ns
module A31_tb();
	reg [7:0]a = 8'd12;
	reg [7:0]b = 8'd34;
	byte c = 8'd67;
	shortint d = 8'd255;
	time fix_time = 0;

	initial begin
		#12
		fix_time = $time();
		$display("Current Simulation Time : %0t", fix_time);
		$display("a is : %0t", a);
		$display("b is : %0t", b);
		$display("c is : %0t", c);
		$display("d is : %0t", d);
	end
endmodule