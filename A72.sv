// Code for transaction class is mentioned in the Instruction tab.
// Write a code to send transaction data between generator and driver.
// Also, verify the data by printing the value of data members of Generator and Driver.
class transaction;
 
	bit [7:0] addr = 7'h12;
	bit [3:0] data = 4'h4;
	bit we = 1'b1;
	bit rst = 1'b0;
	 
endclass

class generator;
  
  transaction t;
  mailbox mbx;
  
  function new(mailbox mbx);
  this.mbx = mbx;  
  endfunction
  
  task main();
    
    for(int i = 0; i < 10; i++) begin
      t = new();
      assert(t.randomize) else $display("Randomization Failed");
      $display("[GEN] : DATA SENT : addr : %0d, data : %0d, we : %0d, and rst : %0d", t.addr, t.data, t.we, t.rst);
      mbx.put(t);      
      #10;
    end
  endtask
  
endclass
 
 
class driver;
  
  transaction dc;
  mailbox mbx;
  
  function new(mailbox mbx);
  this.mbx = mbx;  
  endfunction
  
  task main();
    forever begin
      mbx.get(dc);
      $display("[DRV] : DATA RCVD : addr : %0d, data : %0d, we : %0d, and rst : %0d", dc.addr, dc.data, dc.we, dc.rst);
      #10;
    end
    endtask
  
endclass
 
module tb;
  generator g;
  driver d;
  mailbox mbx;
  
  initial begin
    mbx = new();
    g = new(mbx);
    d = new(mbx);
    
    fork 
      g.main();
      d.main();
    join
      
  end
endmodule