// Create a dynamic array capable of storing 7 elements.
// add a value of multiple of 7 starting from 7 in the array (7, 14, 21 ....49).
// After 20 nsec Update the size of the dynamic array to 20.
// Keep existing values of the array as it is and update the rest 13 elements to a multiple of 5 starting from 5.
// Print Value of the dynamic array after updating all the elements.
// Expected result : 7, 14, 21, 28 ..... 49, 5, 10, 15 ..... 65 .

 `timescale 1ns/1ns

module A34_tb();
	int arr[];
  	int i,j;
	initial begin
		arr = new[7];
		for(i=0;i<7;i++)begin
          arr[i] = 7*(i+1);
		end
		#20
      	arr = new[20](arr);
		for(j=7;j<20;j++)begin
          arr[j] = 5*(j-6);
		end
		$display("arr : %0p",arr);
	end
endmodule