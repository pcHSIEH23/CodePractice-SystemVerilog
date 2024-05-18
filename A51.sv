// Create a Class consisting of 3 data members each of unsigned integer type.
// Initialize them to 45,78, and 90.
// Use the display function to print the values on the console.
`timescale 1ns/1ns

class A;
	bit[31:0] x;
	bit[31:0] y;
	bit[31:0] z;
endclass

module A51_tb();
	A f;
	initial begin
		f = new();
		f.x = 32'd45;
		f.y = 32'd78;
		f.z = 32'd90;

	#1
	$display("Values are : %0d, %0d, and %0d",f.x,f.y,f.z);
	end
endmodule