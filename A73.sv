// Code for transaction class is mentioned in the Instruction tab.
// Write a code to send transaction data between generator and driver.
// Also, verify the data by printing the value of data members of Generator and Driver in each transaction.
// Execute the code for 10 random transactions.

class transaction;
 
	rand bit [7:0] a;
	rand bit [7:0] b;
	rand bit wr;
 
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
      $display("[GEN] : DATA SENT : a : %0d, b : %0d, and wr : %0d", t.a, t.b, t.wr);
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
      $display("[DRV] : DATA RCVD : a : %0d, b : %0d, and wr : %0d", dc.a, dc.b, dc.wr);
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