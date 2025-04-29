module extend (
    input clk, 
    input [1:0] imm_src,
    input [31:0] extend_in,

    output reg [31:0] imm_ext
);
    reg [11:0] aux_extend;

    always @(*)
    begin
        case (imm_src)
            2'b00: //lw
                aux_extend = extend_in[31:20];
            2'b01: //sw
                aux_extend = {extend_in[31:25], extend_in[11:7]};
            2'b10: //beq
                aux_extend = {extend_in[31], extend_in[7], extend_in[30:25], extend_in[11:8]};
            3'b11: //jal
                aux_extend = {extend_in[31], extend_in[19:12], extend_in[20], extend_in[30:21]};
            default: // default to lw
                aux_extend = extend_in[31:20];
        endcase

        imm_ext = {{20{aux_extend[11]}}, aux_extend}; // sign extend
    end

endmodule