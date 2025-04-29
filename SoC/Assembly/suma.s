.data
x: .word 1 # 1
y: .word 80 # 80
z: .word 100 # 100

.text
main:
    la a0, x # load address of x into a0
    la a1, y # load address of y into a1
    la a2, z # load address of z into a2
    lw a5, 0(a0) # load x into a5
    lw a6, 0(a1) # load y into a6
    lw a7, 0(a2) # load z into a7
    add a5, a5, a6 # a5 = x + y
    add a5, a5, a7 # a5 = (x + y) + z
    addi a5, a5, 8 # a5 = (x + y + z) + 8
    addi a5, a5, -4 # a5 = (x + y + z + 8) - 4
