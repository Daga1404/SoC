.data
    A: .word 1, 2, 3, 1, 2, 3, 1, 2, 3 #a11, a12, a13, a21, a22, a23, a31, a32, a33
    B: .word 3, 2, 1, 3, 2, 1, 3, 2, 1 #b11, b12, b13, b21, b22, b23, b31, b32, b33
    C: .space 36 # 3x3 matrix (9 words(integers))

.text
    init:
        la a0, A # set address of A in a0
        la a1, B # set address of B in a1
        la a2, C # set address of C in a2

    setRegs:
        li t3, 3 # size of dimension

    set_i:
        li t0, 0 # i = 0

    loopi: # rows of A (Outer loop)
        bge t0, t3, DONE # if i >= 3, exit loopi
        li t1, 0 # reset j to 0 for each row of A

    loopj: # columns of B (Middle loop)
        bge t1, t3, loopi_inc # if j >= 3, increment i
        
        # Access current C[i][j]
        mul t4, t0, t3 # i * 3
        add t4, t4, t1 # i * 3 + j
        slli t4, t4, 2 # (i * 3 + j) * 4 (word size offset)
        add t5, a2, t4 # t5 = address of C[i][j]
        
        # Initialize C[i][j] to 0
        li s2, 0 # initialize C[i][j] to 0
        sw s2, 0(t5) # store 0 to C[i][j]
        
        li t2, 0 # reset k to 0 for each element of C

    loopk: # shared dimension (Inner loop)
        bge t2, t3, loopj_inc # if k >= 3, increment j
        
        # Access A[i][k]
        mul t4, t0, t3 # i * 3
        add t4, t4, t2 # i * 3 + k
        slli t4, t4, 2 # (i * 3 + k) * 4 (word size offset)
        add t5, a0, t4 # t5 = address of A[i][k]
        lw t6, 0(t5) # load A[i][k] into t6

        # Access B[k][j]
        mul t4, t2, t3 # k * 3
        add t4, t4, t1 # k * 3 + j 
        slli t4, t4, 2 # (k * 3 + j) * 4 (word size offset)
        add t5, a1, t4 # t5 = address of B[k][j]
        lw s0, 0(t5) # load B[k][j] into s0

        # Compute and update C[i][j]
        mul s1, t6, s0 # s1 = A[i][k] * B[k][j]

        # Load current C[i][j]
        mul t4, t0, t3 # i * 3
        add t4, t4, t1 # i * 3 + j
        slli t4, t4, 2 # (i * 3 + j) * 4 (word size offset)
        add t5, a2, t4 # t5 = address of C[i][j]
        lw s2, 0(t5) # load C[i][j] into s2
        
        add s2, s2, s1 # C[i][j] += A[i][k] * B[k][j]
        sw s2, 0(t5) # store result back to C[i][j]

        addi t2, t2, 1 # k++
        j loopk # jump to loopk

    loopj_inc: # increment j
        addi t1, t1, 1 # j++
        j loopj # jump to loopj

    loopi_inc: # increment i
        addi t0, t0, 1 # i++
        j loopi # jump to loopi

    DONE:
        li a7, 10 # syscall for exit
        #ecall      # exit program