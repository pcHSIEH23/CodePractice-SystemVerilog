// Create a Fixed-size array capable of storing 20 elements.
// Add random values to all the 20 elements by using $urandom function.
// Now add all the elements of the fixed-size array to the Queue in such a way
// that the first element of the Fixed-size array should be the last element of the Queue.
// Print all the elements of both fixed-size array and Queue on Console.

module A35_tb();
	int arr[20];
	int a;
	initial begin
		for(a=0;a<20;a++)begin
			arr[a] = $urandom();
		end
	end

	int queue[$];
	int i;

	initial begin
		for(i=19;i>=0;i--)begin
			queue.push_back(arr[i]);
		end
		$display("Fixed-sized array are : %0p",arr);
		$display("Queue are : %0p",queue);
	end
endmodule
	