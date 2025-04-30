onerror {resume}
quietly WaveActivateNextPane {} 0

radix define inst_type {
	"3"  "LOAD",
	"35" "STORE",
	"51" "R_TYPE",
	"99" "B_TYPE",
	"111" "J_TYPE",
	"19" "I_TYPE",
	-default hexadecimal
}

add wave -noupdate -height 40 /main_decoder_tb/clk
add wave -noupdate -height 40 /main_decoder_tb/op
add wave -noupdate -height 40 /main_decoder_tb/branch
add wave -noupdate -height 40 /main_decoder_tb/jump
add wave -noupdate -height 40 /main_decoder_tb/mem_write
add wave -noupdate -height 40 /main_decoder_tb/alu_src
add wave -noupdate -height 40 /main_decoder_tb/reg_write
add wave -noupdate -height 40 /main_decoder_tb/result_src
add wave -noupdate -height 40 /main_decoder_tb/imm_src
add wave -noupdate -height 40 /main_decoder_tb/alu_op
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {95 ps}
