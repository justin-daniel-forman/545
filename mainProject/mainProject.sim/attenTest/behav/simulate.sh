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
ExecStep $xv_path/bin/xsim attenTest_behav -key {Behavioral:attenTest:Functional:attenTest} -tclbatch attenTest.tcl -view /afs/ece.cmu.edu/usr/suyashb/Private/545/mainProject/attenTest_behav.wcfg -log simulate.log
