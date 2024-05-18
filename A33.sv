// Create two arrays of reg type capable of storing 15 elements.
// Use $urandom function to add 15 values to the array.
// Print the value of all the elements of the array on a single line.

module A33_tb();
	reg arr1[15];
	reg arr2[15];

	int i = 0;
	initial begin
		for(i=0;i<15;i++)begin
			arr1[i] = $urandom();
			arr2[i] = $urandom();
		end
	end
	
	initial begin 
      $display("Value of all the elements are : %0p",arr1," %0p",arr2); 
	end
endmodule