# Exercise 1
- A deadlock occurs since every MPI_Ssend process waits until the message has been accepted which will never happen because all processors are starting with send.
- This solution works because when a node sends data to its right neighbour, it will always be waiting and vice versa. And no, it is not an optimal solution.. just consider the scenario of uneven numeber of nodes and we would find ourselves in a deadlock again.
- First they avoid deadlocks and second it improves performance since certain waiting times are avoided.
  
# Exercise 2
- The approximated value of Pi is 3.141593 (the output can be found in pi_output.txt
