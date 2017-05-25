#!/bin/bash

currentWorkingDirectory=$PWD
cd /

thisDate=$(date | awk '{printf "%s-%s-%s-%s",$1,$2,$3,$6}')
mkdir -p /var/demobackup/${thisDate}
tar -cf var/demobackup/${thisDate}/demo.tar root/demo


numberOfValidFiles=$(ls /var/demobackup | awk 'BEGIN {count=0} { if(0 == system("date -d " $0 " >/dev/null 2>/dev/null")){count++;} } END {print(count)}')


while (( $numberOfValidFiles > 7 )); do
	validFiles=(`ls /var/demobackup | awk '{if(0 == system("date -d " $0 " >/dev/null 2>/dev/null"))print($0)}'`)
	lowest="zero"
	for i in "${validFiles[@]}"; do
		if (( lowest == "zero" )); then
			lowest=$i;
			tempold=$(stat -c %Y /var/demobackup/$lowest);
		else
			tempnew=$(stat -c %Y /var/demobackup/$i);
			if (( tempnew < tempold )); then
				lowest=$i;
				tempold=$tempnew;
			fi
		fi
	done
	rm -r /var/demobackup/$lowest

	numberOfValidFiles=$(ls /var/demobackup | awk 'BEGIN {count=0} { if(0 == system("date -d " $0 " >/dev/null 2>/dev/null")){count++;} } END {print(count)}')

done







 
