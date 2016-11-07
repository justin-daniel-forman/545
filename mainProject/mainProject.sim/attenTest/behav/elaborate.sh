#!/bin/sh -f
xv_path="/afs/ece.cmu.edu/support/xilinx/xilinx.release/Vivado-2015.2/Vivado/2015.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 59e691da5a294821974d353606a17697 -m64 --debug typical --relax --mt 8 --include "../../../mainProject.srcs/sources_1/ip/ila_0/ila_v5_1/hdl/verilog" --include "../../../mainProject.srcs/sources_1/ip/ila_0/ltlib_v1_0/hdl/verilog" --include "../../../mainProject.srcs/sources_1/ip/ila_0/xsdbs_v1_0/hdl/verilog" -L xil_defaultlib -L xbip_utils_v3_0 -L xbip_pipe_v3_0 -L xbip_bram18k_v3_0 -L mult_gen_v12_0 -L c_reg_fd_v12_0 -L xbip_dsp48_wrapper_v3_0 -L xbip_dsp48_addsub_v3_0 -L xbip_addsub_v3_0 -L c_addsub_v12_0 -L blk_mem_gen_v8_2 -L unisims_ver -L unimacro_ver -L secureip --snapshot attenTest_behav xil_defaultlib.attenTest xil_defaultlib.glbl -log elaborate.log
