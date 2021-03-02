#!/usr/bin/env bash
for (( c=1; c<=20; c++ ))
do
    LOG_PATH="/home/$(whoami)/log/speedtest.log"
    if result=$(/usr/bin/speedtest --simple); 
    then parsed_result=$(printf "${result}\"" | sed ':a;N;$!ba;s/\n/" /g' | sed 's/: /="/g')
    printf "[$(date)] ${parsed_result}\n" >> "${LOG_PATH}"
    echo " date $result"
    else
    printf "[$(date)] error\n" >> "${LOG_PATH}"
    exit 1  
    fi 
done
exit 0
