main:
    li a5, 0          # Initialize a5 to zero
    li a6, 200        # Load 200 into a6

check:
    bge a5, a6, end   # If a5 >= 200, end loop

forLoop:
    addi a5, a5, 10   # Increment a5 by 10
    mv a0, a5         # Move a5 to a0 for printing
    li a7, 1          # Syscall: print integer
    ecall

    j check           # Repeat loop

end: