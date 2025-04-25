
.text
init:
addi sp, sp, -804 # Allocate stack space
li a5, 200 # Initialize a5 to 200
li a6, 0 # Initialize a6 to 0
sw zero, 0(sp) # Store zero at the top of the stack

loop:
lw a0, 0(sp) # Load the value at address sp into a0
addi a0, a0, 10 # Increment a0 by 10
sw a0, 4(sp) # Store a0 at address sp + 4 
addi sp, sp, 4 # Increment sp by 4
addi a6, a6, 1 # Increment a6 by 1
bne a6, a5, loop # if a6 != a5 then target



