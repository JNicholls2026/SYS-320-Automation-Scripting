#!/bin/bash

pageCount=""
file="/var/log/apache2/access.log"

function getPageCount(){
	pageCount=$(cat "$file" | cut -d' ' -f7 | tr -d "[" | sort | uniq -c)
	}

getPageCount
printf "%s\n" $pageCount
