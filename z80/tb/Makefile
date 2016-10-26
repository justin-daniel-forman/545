ocf_fsm:
	vcs -sverilog -debug ../z80_control.sv ocf_fsm_tb.sv ../../library/library.sv

mrd_fsm:
	vcs -sverilog -debug ../z80_control.sv mrd_fsm_tb.sv ../../library/library.sv

decoder:
	vcs -sverilog -debug ../z80_control.sv decoder_tb.sv ../../library/library.sv

control:
	vcs -sverilog -debug ../z80_control.sv control_tb.sv ../../library/library.sv

top:
	perl macros.pl
	vcs -sverilog ../z80_control.sv ../z80_datapath.sv ../z80_top.sv ../../library/library.sv ../z80_memory.sv ../z80_ports.sv top_tb.sv

regfile:
	vcs -sverilog -debug ../z80_datapath.sv ../../library/library.sv regfile_tb.sv

datapath:
	vcs -sverilog -debug ../z80_datapath.sv ../../library/library.sv datapath_tb.sv

clean:
	rm -rf simv
	rm -rf simv.daidir

verify-all:
	perl testbench.pl NULL NULL VERIFY

verify-file:
	perl testbench.pl NULL ${ARGS} VERIFY

debug-file:
	perl testbench.pl DEBUG ${ARGS} NULL
