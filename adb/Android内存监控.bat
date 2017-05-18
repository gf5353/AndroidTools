@ECHO OFF

COLOR 0A

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::           内存(RAM)监控显示V1.0             ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             作者：Findyou                    ::

:::::::      版本:V1.0       时间：2015.03.25       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

SET packagename=tv.fuzegame.fuzelauncher



:: 获取得小时,格式为：24小时制，10点前补0

SET c_time_hour=%time:~0,2%

IF /i %c_time_hour% LSS 10 (

SET c_time_hour=0%time:~1,1%

)

SET logfilename="%~dp0%date:~0,4%%date:~5,2%%date:~8,2%%c_time_hour%%time:~3,2%%time:~6,2%_RAM.txt"

ECHO."内存信息监控" >%logfilename%

:Startscreencap

adb shell procrank >>%logfilename%

CLS

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::            内存信息监控显示                 ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.  PID       Vss      Rss      Pss      Uss  cmdline

FINDSTR /C:"%packagename%" %logfilename%

ping -n 2 127.0.0.1>nul

GOTO Startscreencap