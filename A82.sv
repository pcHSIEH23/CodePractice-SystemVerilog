// Create Monitor and Scoreboard Code for Synchronous 4-bit Multiplier.
// Stimulus is generated in Testbench top so do not add Transaction, Generator, or Driver Code.
// Also, add the Scoreboard model to compare the response with an expected result.


//// Design Code
module top
(
  input clk,
  input [3:0] a,b,
  output reg [7:0] mul
);
  
  always@(posedge clk)
    begin
     mul <= a * b;
    end
endmodule


//// Transaction
class transaction;
 randc bit [3:0] a;
 randc bit [3:0] b;
 bit [7:0] mul;
  
  
 function void display();
    $display("a : %0d \t b: %0d \t mul : %0d",a,b,mul);
 endfunction


//// Interface Code
interface top_if;
  logic clk;
  logic [3:0] a, b;
  logic [7:0] mul;
endinterface

//// Monitor
class monitor;
  
  mailbox #(transaction) mbx;
  transaction trans;
  virtual top_if aif;
  
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
  
  task run();
    trans = new();
    forever begin
      repeat(2) @(posedge aif.clk);
      trans.a = aif.a;
      trans.b = aif.b;
      trans.mul = aif.mul;
      $display("-------------------------");
      $display("[MON] : DATA SENT TO SCOREBOARD");
      trans.display();
      mbx.put(trans);
    end
  endtask
endclass

//// Scoreboard
class scoreboard;
  
  mailbox #(transaction) mbx;
  transaction trans;
  
    function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
   endfunction
  
  task compare(input transaction trans);
    if((trans.mul) == (trans.a + trans.b)) 
      $display("[SCO] : Sum Result Matched");
    else
      $error("[SCO] : Result Mismatched");
  endtask
 
  task run();
    forever begin
      mbx.get(trans);
      $display("[SCO] : DATA RCVD FROM MONITOR");
      trans.display();
      compare(trans);
      $display("-------------------------");
      #40;
    end
  endtask
endclass


//// Testbench Top Code
module tb;
  
  top_if vif();
  monitor mon;
  scoreboard sco;
  mailbox #(transaction) mbx;
  
  top dut (vif.clk, vif.a, vif.b, vif.mul);
  
  initial begin
    vif.clk <= 0;
  end
  
  always #5 vif.clk <= ~vif.clk;
  
  initial begin
    for(int i = 0; i<20; i++) begin
      @(posedge vif.clk);
      vif.a <= $urandom_range(1,15);
      vif.b <= $urandom_range(1,15);
    end
  end

  initial begin
    mbx = new();
    mon = new(mbx);
    sco = new(mbx);
    mon.aif = aif;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;    
    #300;
    $finish();
  end
  
endmodule