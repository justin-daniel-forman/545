ocf_fsm:
	vcs -sverilog -debug ../z80_control.sv ocf_fsm_tb.sv ../../library/library.sv

decoder:
	vcs -sverilog -debug ../z80_control.sv decoder_tb.sv ../../library/library.sv

control:
	vcs -sverilog -debug ../z80_control.sv control_tb.sv ../../library/library.sv

top:
	vcs -sverilog -debug ../z80_control.sv ../z80_datapath.sv ../z80_top.sv ../../library/library.sv top_tb.sv

regfile:
	vcs -sverilog -debug ../z80_datapath.sv ../../library/library.sv regfile_tb.sv

datapath:
	vcs -sverilog -debug ../z80_datapath.sv ../../library/library.sv datapath_tb.sv
