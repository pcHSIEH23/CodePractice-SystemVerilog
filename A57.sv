// Create a deep copy of the Generator class.
// To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top.
// Print the value of data members in the generator class as well as copied class.
// Refer Instruction tab for Generator class code.

class generator;
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;

  function generator copy();
  	copy = new();
  	copy.a = a;
  	copy.b = b;
  	copy.wr = wr;
  	copy.en = en;
  	copy.s = s;
  endfunction
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction
endclass

class answer;
	int ds = 34;
	generator g1;

	function new();
		g1 = new();
	endfunction

	function answer copy();
		copy = new();
		copy.ds = ds;
		copy.g1 = g1.copy;
	endfunction
endclass

module A57_tb();
	answer s1,s2;
	initial begin
		s1 = new();
		s2 = new();

		s1.ds = 45;
		s2 = s1.copy();
		s1.g1.display();
		s2.g1.display();
		$display("Value of s1 : %0d", s1.ds);
		$display("Value of s2 : %0d", s2.ds);
		s1.g1.s = 10;
		s1.g1.display();
		s2.g1.display();
	end
endmodule