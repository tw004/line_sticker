#!/bin/bash

FILE=list.txt

while IFS='' read -r line || [[ -n "$line" ]]; do
    line1=`echo "$line" | awk '{print $1}'`
    line2=`echo "$line" | awk '{print $2}'`
    ./core.sh $line1 $line2
done < "$FILE"
