@echo off
cls
set filter=%1

if not "%filter%"=="" (
echo ��ǰ��صĽ���Ϊ��%filter%)

set filename=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%
set postfix=logcat.txt
set debugfilename=%postfix%

echo �������־�ļ�Ϊ��%debugfilename%

if "%filter%"=="" (adb logcat -d -v time > %debugfilename%)
if not "%filter%"=="" (
for /f "delims=" %%i in ('adb shell ps ^| findstr %filter% ') do set i=%%i
if "%i%"=="" (echo "δ��ȡ����ǰӦ�õĽ���ID�������ԣ�")
if not "%i%"=="" (
set pid=%i:~10,5%
echo "����ID"%pid%
adb logcat -d -v time | findstr %pid% > %debugfilename%
)
)