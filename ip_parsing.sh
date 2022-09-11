uniq -c logfile.txt | awk '{print $2": "$1}'
