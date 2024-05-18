// Assume the class consists of three 8-bit data members a, b, and c.
// Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class.
// Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.

class first;
	bit[7:0] a,b,c;

	function new(input bit[7:0] data1=0, input bit[7:0] data2=0, input bit[7:0] data3=0);
		this.a = data1;
		this.b = data2;
		this.c = data3;
	endfunction
endclass

module A55_tb();
	first f1;

	initial begin
		f1 = new(2,4,56);
		$display("a : %0d, b : %0d, c : %0d",f1.a,f1.b,f1.c);
	end
endmodule