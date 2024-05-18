// Create a function that will perform the multiplication of the two unsigned integer variables.
// Compare values return by function with the expected result
// and if both values match send "Test Passed" to Console else send "Test Failed".

module A52_tb();
	function void compare(input bit[31:0]a,b);
		if(a == b)begin
			$display("Test Passed");
		end
		else begin
			$display("Test Failed");
		end
	endfunction

	initial begin
		compare(32'd0,32'd0);
		compare(32'd5,32'd0);
	end
endmodule