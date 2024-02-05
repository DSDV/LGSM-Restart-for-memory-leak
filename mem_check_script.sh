#!/bin/bash
# Credits:
# https://www.christophe-casalegno.com/how-to-simply-check-free-memory-and-take-action-when-a-threshold-is-reached
# How to simply check free memory and take action when a threshold is reached | Christophe Casalegno
#Thresholds in percent:
threshold1=75 # in percent for first reach point
threshold2=85 # in percent for second reach point
# currently does not log
logfile="/dev/null"
#logfile="/var/log/memory.log"
# Calculate real occupied memory in percent
realmem=`free | awk 'FNR == 2 {print 100-(($2-$3)/$2)*100}' |cut -d "." -f1`
# threshold1
if [ "$realmem" -gt "$threshold1" ]
then
date=`date`
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_over_80%_Ramusage!_Will_restart_at_90%!'
echo "$date : The memory usage has reached $realmem% on $host." >> $logfile
# Put your own threshold1 commands here
# and before here
#
# threshold2
if [ "$realmem" -gt "$threshold2" ]
then
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_restarts_in_30_seconds_!'
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_restarts_in_30_seconds_!'
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_restarts_in_30_seconds_!'
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_restarts_in_30_seconds_!'
/home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon -c /home/pwserver/rcon/rcon-0.10.3-amd64_linux/rcon.yaml 'Broadcast Server_restarts_in_30_seconds_!'
sleep 30s
/home/pwserver/pwserver restart
echo "$date : Alert T2 : The memory usage has reached $realmem% on $host." >> $logfile
# Put your own threshold2 commands here
# and before here
fi
fi
