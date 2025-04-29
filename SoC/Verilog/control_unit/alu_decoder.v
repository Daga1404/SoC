module alu_decoder (
    input clk,
    input [1:0] alu_op, 
    input [2:0] funct3,
    input funct7_5, op_5,

    output reg [2:0] alu_control
);
    always @(posedge clk)
        begin
            case (alu_op)
                'b00:
                    begin
                        alu_control <= 3'b000; // add
                    end
                'b01: 
                    begin
                        alu_control <= 3'b001; // sub
                    end
                'b10:
                    begin
                        case (funct3)
                            'b000:
                                begin
                                    case ({funct7_5, op_5})
                                        'b11:
                                            alu_control <= 3'b001; // sub
                                        default: 
                                            alu_control <= 3'b000; // add
                                    endcase
                                end
                            'b010:
                                alu_control <= 3'b101; // slt
                            'b011:
                                alu_control <= 3'b110; // mul
                            'b110:
                                alu_control <= 3'b011; // or
                            'b111:
                                alu_control <= 3'b010; // and
                        endcase
                    end 
                default: 
                    alu_control <= 3'b000; // default to add
            endcase
        end
    
endmodule