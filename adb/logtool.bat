@echo off
cls
set filter=%1

if not "%filter%"=="" (
echo 当前监控的进程为：%filter%)

set filename=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
set postfix=logcat.txt
set debugfilename=%postfix%

echo 保存的日志文件为：%debugfilename%

if "%filter%"=="" (adb logcat -d -v time > %debugfilename%)
if not "%filter%"=="" (
for /f "delims=" %%i in ('adb shell ps ^| findstr %filter% ') do set i=%%i
if "%i%"=="" (echo "未获取到当前应用的进程ID，请重试！")
if not "%i%"=="" (
set pid=%i:~10,5%
echo "进程ID"%pid%
adb logcat -d -v time | findstr %pid% > %debugfilename%
)
)