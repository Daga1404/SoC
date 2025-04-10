
.data
    A: .word 1, 2, 3, 1, 2, 3, 1, 2, 3 #a11, a12, a13, a21, a22, a23, a31, a32, a33
    B: .word 3, 2, 1, 3, 2, 1, 3, 2, 1 #b11, b12, b13, b21, b22, b23, b31, b32, b33
    C: .space 36 # 3x3 matrix (9 words(integers))

.text
    init:
        la a0, A # set address of A in a0
        la a1, B # set address of B in a1
        la a2, C # set address of C in a2

        li t0, 0 # i = 0
        li t1, 0 # j = 0
        li t2, 0 # k = 0
        li t3, 3 # temp variable for iteration

    loopi: # rows of A
        li t1, 0 # reset j to 0 for each row of A
        addi t0, t0, 1 # i++
        j loopj # jump to loopj
        
    loopj: #c olumns of B
        addi t1, t1, 1 # j++
        blt t1, t3, loopk # if j < 3, continue loopk

    loopk: # shared dimension
        addi t2, t2, 1 # k++
        blt t2, t3, memAccess # if k < 3, continue memAccess
    
    memAccess:
        //Access A[i][k]
        mul t4, t0, t3 # i * 3
        add t4, t4, t2 # i * 3 + k
        slli t4, t4, 2 # (i * 3 + k) * 4 (word size offset)
        add t5, a0, t4 # t5 = address of A[i][k]
        lw t6, 0(t5) # load A[i][k] into t6

        //Access B[k][j]
        mul t4, t2, t3 # k * 3
        add t4, t4, t1 # k * 3 + j 
        slli t4, t4, 2 # (k * 3 + j) * 4 (word size offset)
        add t5, a1, t4 # t5 = address of B[k][j]
        lw s0, 0(t5) # load B[k][j] into s0

        //Compute and store C[i][j]
        mul s1, t6, s0 # s1 = A[i][k] * B[k][j]

        //load current C[i][j]
        mul t4, t0, t3 # i * 3
        add t4, t4, t1 # i * 3 + j
        slli t4, t4, 2 # (i * 3 + j) * 4 (word size offset)
        add t5, a2, t4 # t5 = address of C[i][j]
        lw s2, 0(t5) # load C[i][j] into s2

        add s2, s2, s1 # C[i][j] += A[i][k] * B[k][j]
        sw s2, 0(t5) # store result back to C[i][j]
