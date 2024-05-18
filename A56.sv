// Assume class consists of three data members a, b, and c each of size 4-bit.
// Create a task inside the class that returns the result of the addition of data members.
// The task must also be capable of sending the value of a, b, c, and result to the console.
// Verify code for a = 1, b = 2, and c = 4.

class first;
	bit [3:0]a,b,c;
	function new(input bit[3:0] data1=0, input bit[3:0] data2=0, input bit[3:0] data3=0);
		this.a = data1;
		this.b = data2;
		this.c = data3;
	endfunction
	task display();
		$display("a : %0d, b : %0d, c : %0d",a,b,c);
	endtask
endclass

module A56_tb();
	first f1;

	initial begin
		f1 = new(1,2,4);
		f1.display();
	end
endmodule