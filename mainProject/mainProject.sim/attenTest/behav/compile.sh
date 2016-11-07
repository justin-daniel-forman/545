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
echo "xvlog -m64 --relax -prj attenTest_vlog.prj"
ExecStep $xv_path/bin/xvlog -m64 --relax -prj attenTest_vlog.prj 2>&1 | tee compile.log
echo "xvhdl -m64 --relax -prj attenTest_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj attenTest_vhdl.prj 2>&1 | tee -a compile.log
