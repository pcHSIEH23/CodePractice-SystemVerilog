// Create transaction, Generator and Driver code for Synchronus 4-bit Multiplier.

//// TB
class transaction;
  randc bit [3:0] a;
  randc bit [3:0] b;
  bit [7:0] mul;
 
  function void display();
    $display("a: %0d, b: %0d, mul: %0d", a, b, mul);
  endfunction
 
  function transaction copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.mul = this.mul;
  endfunction
 
endclass

class generator;
 
  transaction t;
  mailbox #(transaction) mbx;
  event done;
 
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
    t = new();
  endfunction
 
  task run();
    for(int i=0;i<10;i++)
      begin
        assert(t.randomize()) else $display("randomization failed");
        mbx.put(t.copy);
        $display("[GEN] : data sent to driver");
        t.display();
        #20;
      end
    ->done;
  endtask
 
endclass


interface add_if;
 
  logic [3:0] a, b;
  logic [7:0] mul;
  logic clk;
 
  modport DRV (output a,b, input mul,clk);//defines the flow of the interface variables in a class
 
endinterface

class driver;
 
  virtual add_if.DRV aif;//adding .DRV to specify the modportt rules
  mailbox #(transaction) mbx;
  transaction data;
 
  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction
 
  task run();
    forever begin
      mbx.get(data);
      @(posedge aif.clk);
      aif.a <= data.a;
      aif.b <= data.b;
      aif.mul <= data.mul;
      $display("[DRV] : interface trigger");
      data.display();

    end
  endtask
 
endclass

module A81_tb();
 
  add_if aif();
  driver d;
  generator g;
  mailbox #(transaction) mbx;
  event done;
 
  top dut(aif.clk, aif.a, aif.b, aif.mul);
 
  initial aif.clk = 0;
 
  always #10 aif.clk <= ~aif.clk;
 
  initial
    begin
      mbx = new();
      d = new(mbx);
      g = new(mbx);
      d.aif = aif;
      done = g.done;
    end
 
  initial
    begin
      fork
        g.run();
        d.run();
      join_none
      wait(done.triggered);
      $finish();
    end
 
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
     
    end
 
endmodule


//// Design
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