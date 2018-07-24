#!/bin/sh 

NEXT_SECOND=$(date "+%Y-%m-%d %H:%M:%S" --date="1 seconds")  
echo $NEXT_SECOND  

adb pull /data/anr/ "$NEXT_SECONDanr"


