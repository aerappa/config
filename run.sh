#!/usr/bin/sh

current_time=$(date "+%Y.%m.%d-%H:%M")
logfile=$current_time.log
touch $logfile

source setup.sh 2>&1 | tee $logfile
