@ECHO OFF

ECHO.[输出ANR文件]

ECHO.-------------------------------

adb pull /data/anr/ "%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%anr"


ECHO.[暂停5秒自动关闭...]

ping -n 5 127.0.0.1>nul

@ECHO ON


