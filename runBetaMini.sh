#!/bin/bash
##################################
#	runBetaMini.sh
#
#  This script gets executed by condor to run the analysis job.
#  The tcl file containing the collections to be analyzed, in the
#  form 'lappend inputlist <collectionname>' is specified by the
#  $COLL_FILE environment variable. 
#
#####################################

echo
echo This is job number ${CLUSTERID}.${PROCESSID}

echo 
echo Where am I?
uname -a

echo
echo What is the enviornment
env

echo 
echo Uptime
uptime

echo
echo whoami?
whoami

INITIALDIR=$PWD
echo
echo "===>Current directory" $INITIALDIR
find .


#OUTPUT NAME:
export OUTPUTROOTFILE=output-${CLUSTERID}.root
echo "===>Output file name" $OUTPUTROOTFILE

#
# set up babar environment
#
source /home/babar/setup_babar.sh
echo "===> finished setup_babar script"


WORKDIR=/home/babar/tst52/workdir

cp *.tcl $WORKDIR/

cd $WORKDIR
echo 
echo "===> current directory "
pwd
find .

echo 
echo "===> running set-srtpath "
source /home/babar/BFROOT/bin/SRTstartup.sh analysis-52 Linux26SL5_i386_gcc412 
echo "===> finished set-srtpath"

source /home/babar/BFROOT/bin/cond24boot09.sh
echo "===> finished cond24boot09"

echo
echo "===> cat a52.tcl "
cat a52.tcl

echo
echo I should run this script : $MYEXEC


echo
echo "====> start BetaMiniApp "
BetaMiniApp a52.tcl

echo
echo "...end of BetaMiniApp"
echo
#
# move root file
#
mv output-${CLUSTERID}.root $INITIALDIR 

cd $INITIALDIR

echo "===>Current directory" $INITIALDIR
find .

echo
echo "... end of runBetaMini.sh "
