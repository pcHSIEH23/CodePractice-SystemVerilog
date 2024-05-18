// Create an array capable of storing 10 elements of an unsigned integer.
// Initialize all the 10 elements to a value equal to the square of the index of that element.
// for e.g. first element has index no. 0 so initialize it to 0,
// the second element has index no. 1 so initialize it to 1,
// the third element has index no. 2 so initialize it to 4, and so on.
// Verify the code by sending values of all the elements on Console.

module A32_tb();
	byte arr[10] = '{0,1,4,9,16,25,36,49,64,81};
	initial begin
		$display("Value of element: %0p", arr);
	end
endmodule

/*
initial begin
	for(int i=0; i<10; i++)
      arr[i]=i*i;
    $display("arr = %0p",arr);
end
*/