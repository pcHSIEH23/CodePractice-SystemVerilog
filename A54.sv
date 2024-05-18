// Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248).
// Store this value in the local array of the testbench top and also print the value of each element of this array on the console.

module A54_tb();
	bit [7:0] res[32];

	function automatic void init_arr(ref bit [7:0] a[32]);
		for(int i=0;i<32;i++)begin
			a[i] = 8*i;
		end
	endfunction

	initial begin
		init_arr(res);
		for(int i=0;i<32;i++)begin
			$display("res[%0d] : %0d",i,res[i]);
		end
	end
endmodule