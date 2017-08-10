#!/bin/sh
usage="robification < testmode 0|1 > < num files >"

testmode=$1
if [ "" = "$testmode" ]; then
        >&2 echo "Missing testMode as first environmet"
        echo $usage
        exit 1
fi

numFiles=$2
if [ "" = "$numFiles" ]; then
        >&2 echo "Missing numFiles as second argument"
        echo $usage
        exit 1
fi

counter=0
start=$(date +%s)

cd "/tmp/robi"
#robification ist "Starting to drop $numFiles"

for filename in *; 
do
        if [ $counter -lt $numFiles ]; then  
                if [ $testmode = 0 ]; then
			printf "\033c"
			percent=$((200*$counter/$numFiles % 2 + 100*$counter/$numFiles))
			echo "Dropped "$counter" of "$numFiles" ["$percent"%]"
                        cp $filename /data/ingestion/incoming/
                        sleep 1.03
                       	mv $filename /tmp/robi-processed/
                        #rm ../../test_processed/$filename
                else
			printf "\033c"
			percent=$((200*$counter/$numFiles % 2 + 100*$counter/$numFiles))
			echo "SIMULATION: Dropped "$counter" of "$numFiles" ["$percent"%]"
			#if [$(($percent % 10 == 0))]; then
			#	echo "oof"
			#fi
                        sleep 0.1
                fi
                counter=$((counter +1))
        fi
done

finish=$(date +%s)
duration=$(( finish - start ))

echo "Processed $counter files in $duration seconds."
#robification ist "\@Robi Dropped $counter files in $duration seconds. Drop another batch!"
