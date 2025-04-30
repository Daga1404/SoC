
addi a0, zero, 24       # a0 = 24
addi a1, zero, 3        # a1 = 3
addi t2, zero, 0        # t2 = 0
add t3, a1, zero       # t3 = a1
beq a0, a6, +0x10       # if a0 == a6, branch
addi t2, t2, 1          # t2 += 1
add t3, t3, a1         # t3 += a1
jal x0, -0x10           # jump back 16 bytes (loop)
add a0, t2, zero        # a0 = t2
