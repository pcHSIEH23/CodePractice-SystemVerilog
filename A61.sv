// Assume generator class consists of three 8-bit data members (x,y, and z).
// Write a code to generate 20 random values for all the data members at an interval of 20 ns.

class generator;
	rand bit[7:0] x,y,z;
endclass

module A61_tb();
	generator g;
	int i;

	initial begin
		g = new();
		for(i=0;i<20;i++)begin
			g.randomize();
			$display("Value of x : %0d and y : %0d, and z : %0d",g.x,g.y,g.z);
			#20
		end
	end

	initial begin
		assert(g.randomize())else begin
    	$display("Randomization failed at time:%0t",$time);
    	$finish();
   		end
	end
endmodule


class generator;
	randc bit [7:0] x,y,z;   //add modifier for data members
endclass

module answer;
	generator g;  //handler for generator class
	int i;
	initial begin
		for(i=0;i<20;i++) begin
   			g=new();  // add objects of generator class in for loop to overcome overwritting the object while generation multiple stimuli 
 
   			assert(g.randomize())else begin//check the randomizaton is successful or not: 2- using assert
    		$display("Randomization failed at time:%0t",$time);
    		$finish();
   		end
   		$display("Value of x: %0d, y: %0d and z: %0d", g.x,g.y,g.z);
   		#20;
		end
	end
endmodule