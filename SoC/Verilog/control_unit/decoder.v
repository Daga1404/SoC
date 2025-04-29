module decoder (
    input clk, zero,
    input [6:0] op,
    input [2:0] funct3,
    input funct7_5,

    output branch, 
           jump, 
           mem_write, 
           alu_src, 
           reg_write,

    output [1:0] result_src, 
                 imm_src,
    output [2:0] alu_control
);

    wire [2:0] alu_op;

    main_decoder m_dec_u1 (
        .clk(clk),
        .op(op),
        .branch(branch), 
        .jump(jump), 
        .mem_write(mem_write), 
        .alu_src(alu_src), 
        .reg_write(reg_write),
        .result_src(result_src), 
        .imm_src(imm_src),
        .alu_op(alu_op)
    );

    alu_decoder a_dec_u1 (
        .clk(clk),
        .alu_op(alu_op), 
        .funct3(funct3),
        .op_5(op[5]),
        .funct7_5(funct7_5),
        .alu_control(alu_control)
    );

    
endmodule