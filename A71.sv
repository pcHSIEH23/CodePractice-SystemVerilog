// Create two tasks each capable of sending a message to Console at a fixed interval.
// Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns
// while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns.
// Keep the count of the number of times Task 1 and Task 2 trigger
// by adding a variable for keeping the track of task execution and incrementing with each trigger.
// Execute both tasks in parallel till 200 nsec.
// Display the number of times Task 1 and Task 2 executed after 200 ns
// before calling $finish for stopping the simulation.
module tb;
	int task1_num,task2_num;
 
task Task1;
#20;
$display("Task1 trigger");
endtask

task Task2;
#40;
$display("Task2 trigger");
endtask

initial begin
	for(int i=0;i<15;i++)begin
		Task1();
		task1_num++;
	end
end 
 
initial begin
	for(int i=0;i<15;i++)begin
		Task2();
		task2_num++;
	end
end 

initial begin
	#200;
	$display("Number of times Task1 : %0d, and Task2 : %0d",task1_num,task2_num);
	$finish();
end
endmodule