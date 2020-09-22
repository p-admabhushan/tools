#! /bin/bash
 
#
# This script will generate thread dumps to /opt folder every <interval (seconds)> for <number of dumps> times
 
case "$1" in
    jstack)
        CMD=jstack

    ;;
    signal)
        CMD="kill -QUIT"
    ;;
    *)
        echo "Usage: td.sh {jstack|signal} <pid> <number of dumps> <interval (seconds)>"
        exit 1;
esac
 
i=0
while [ $i -lt $3 ]
do
    $CMD -l $2 > /opt/td$i.txt
    sleep $4
    let i=$i+1
done




