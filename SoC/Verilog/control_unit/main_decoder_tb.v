

module main_decoder_tb();


reg 			clk;

reg [6:0] 	op;
wire			branch;
wire			jump;
wire			mem_write;
wire			alu_src;
wire			reg_write;
					
wire [1:0]	result_src;
wire [1:0]	imm_src;
wire [1:0]	alu_op;

main_decoder DUT(
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

always
	#1 clk = ~clk;

initial
begin
	clk = 0;
	#10;
	op = 0;	//Default
	#10
	op = 19;
	#10
	op = 3;
	#10;
	op = 35;
	#10
	op = 4;	//Default
	#10
	op = 51;
	#10
	op = 99;
	#10
	op = 111;
	#10
	
	$stop;
	$finish;
end
	
endmodule 