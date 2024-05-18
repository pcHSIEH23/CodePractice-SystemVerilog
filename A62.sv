// Assume generator class consists of three 8-bit data members (x,y, and z).
// Write a code to generate 20 random values for all the data members at an interval of 20 ns.
// Random values for all data members should range from 0 to 50.

class generator;
	rand bit[7:0]x,y,z;
	extern constraint data;
	extern function void display();
endclass

constraint generator :: data{
	x inside {[0:50]};
	y inside {[0:50]};
	z inside {[0:50]};
}

function void generator :: display();
	$display("Value of x : %0d, y : %0d, and z : %0d",x,y,z);
endfunction

module A62_tb();
	generator g;
	int i;
	initial begin
		g = new();
		for(i=0;i<20;i++)begin
			assert(g.randomize()) else $display("Randomization Failed");
			g.display();
			#20; // Do not forget ";""
		end
	end
endmodule