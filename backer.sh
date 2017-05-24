#! /bin/bash

currentWorkingDirectory=$PWD
cd /
thisDate=$(date | awk '{printf "%s-%s-%s-%s",$1,$2,$3,$6}')
mkdir -p /var/demobackup/${thisDate}
tar -cf var/demobackup/${thisDate}/demo.tar root/demo



 
