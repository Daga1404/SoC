module main_decoder (
    input clk,
    input [6:0] op,
    output reg branch, 
               jump, 
               mem_write, 
               alu_src, 
               reg_write,

    output reg [1:0] result_src, 
                     imm_src,
                     alu_op

);
    always @(posedge clk)
        begin
            case (op)
                'd3: //lw
                    begin
                        reg_write <= 1;
                        imm_src <= 2'b00;
                        alu_src <= 1;
                        mem_write <= 0;
                        result_src <= 2'b01;
                        branch <= 0;
                        alu_op <= 2'b00;
                        jump <= 0;
                    end
                'd19: // I-Type
                    begin
                        reg_write <= 1;
                        imm_src <= 2'b00;
                        alu_src <= 1;
                        mem_write <= 0;
                        result_src <= 2'b00;
                        branch <= 0;
                        alu_op <= 2'b10;
                        jump <= 0;
                    end
                'd51: // R-Type
                    begin
                        reg_write <= 1;
                        imm_src <= 2'bXX;
                        alu_src <= 0;
                        mem_write <= 0;
                        result_src <= 2'b00;
                        branch <= 0;
                        alu_op <= 2'b10;
                        jump <= 0;
                    end
                'd35: // sw
                    begin
                        reg_write <= 0;
                        imm_src <= 2'b01;
                        alu_src <= 1;
                        mem_write <= 1;
                        result_src <= 2'bXX;
                        branch <= 0;
                        alu_op <= 2'b00;
                        jump <= 0;                    
                    end
                'd99: // beq
                    begin
                        reg_write <= 0;
                        imm_src <= 2'b01;
                        alu_src <= 0;
                        mem_write <= 0;
                        result_src <= 2'bXX;
                        branch <= 1;
                        alu_op <= 2'b01;
                        jump <= 0;   
                    end
                'd111: // jal
                    begin
                        reg_write <= 1;
                        imm_src <= 2'b11;
                        alu_src <= 'bX;
                        mem_write <= 0;
                        result_src <= 2'b10;
                        branch <= 0;
                        alu_op <= 2'bXX;
                        jump <= 1;    
                    end
                default:
                    begin
                        reg_write <= 0;
                        imm_src <= 2'b00;
                        alu_src <= 0;
                        mem_write <= 0;
                        result_src <= 2'b00;
                        branch <= 0;
                        alu_op <= 2'b00;
                        jump <= 0;    
                    end
            endcase
        end

    
endmodule