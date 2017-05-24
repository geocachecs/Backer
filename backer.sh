#! /bin/bash

currentWorkingDirectory=$PWD
cd /

numberOfValidFiles=$(ls /var/demobackup | awk 'BEGIN {count=0} { if(0 == system("date -d " $0 " >/dev/null")){count++;} } END {print(count)}')





thisDate=$(date | awk '{printf "%s-%s-%s-%s",$1,$2,$3,$6}')
mkdir -p /var/demobackup/${thisDate}
tar -cf var/demobackup/${thisDate}/demo.tar root/demo



 
