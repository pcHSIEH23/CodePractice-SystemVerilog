// For the Generator code mentioned in the Instruction tab,
// expected values for variable a ranges from 0 to 8,
// variable b ranges from 0 to 5.
// Also, add logic to store the number of times randomization failed.
// Print values of variables during each iteration and error count after generating 20 random values for a and b.
// Add Constraint Code and Testbench top code to the Design.

class generator;
  rand bit [4:0] a;
  rand bit [5:0] b;
  extern constraint data;
  extern function void display();
endclass

constraint generator :: data{
  a inside {[0:8]};
  b inside {[0:5]};
};

function void generator :: display();
  $display("Value of a : %0d, b : %0d",a,b);
endfunction

module A63_tb();
  generator g;
  int i,j=0;
  initial begin
    g = new();

    for(i=0;i<20;i++)begin
      assert(g.randomize())
      else begin
        $display("Randomization Failed");
        j++;
      end
      g.display(); 
    end
    #20;
    $display("The number of times randomization failed : %0d",j);
  end
endmodule
