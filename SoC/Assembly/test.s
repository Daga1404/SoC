
.text
main:
    li a5, 9
    li a6, 0
    li a7, 0
    li a0, 0x100
    li a1, 0x00000000
    li a2, 0x00FF00
    j loop

loop:
    #li a2, 0xFFFFFF
    ecall
    addi a1, a1, 1    # Increment a1 by 1
    j check

check:
    bge a6, a5, shift # If a6 >= a5, jump to shift
    addi a6, a6, 1 # Increment a6 by 1
    j loop # Jump back to loop

shift:
    addi a7, a7, 1 # Increment a7 by 1
    add a1, zero, a7 # Set a5 to the value of a7
    li a6, 0
    slli a1, a1, 16 # Shift left logical immediate a1 by 1
    j loop # Jump back to loop
