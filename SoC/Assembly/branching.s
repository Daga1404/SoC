li a5, 5
li a6, 6

bge a5, a6, g_o_e # iif a5 >= a6, jump to g_o_e
addi a4, zero, 120 # a4 = 120 (s=120)
j stop # jump to stop


g_o_e:
beq a5, a6, eq # if a5 == a6, jump to eq
addi a4, zero, 80 # a4 = 80 (s=80)
j stop # jump to stop
    

eq: 
addi a4, zero, 120 # a4 = 120 (s=120)
j stop # jump to stop

stop:
li a0, 10 # syscall for exit
ecall
