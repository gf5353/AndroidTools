#!/bin/sh 

echo "[����logcat��־]"  
NEXT_SECOND=$(date "+%Y-%m-%d %H:%M:%S" --date="1 seconds")  
echo $NEXT_SECOND  
adb logcat -d -v time>"$NEXT_SECOND.log"

