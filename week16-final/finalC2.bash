#!/bin/bash

#log_file=$1
#ioc_file=$2

> "report.txt"

#while read ioc; do
#	grep "$ioc" "$log_file" | awk '{print $1, $4, $7}' | tr -d '[' >> report.txt
#done < "ioc.txt"

while read -r pattern; do
	grep "$pattern" "access.log" | awk '{print $1, $4, $5, $7}' | sed 's/\[//g; s/\]//g' >> "report.txt"
done < "ioc.txt"
