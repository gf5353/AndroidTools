@ECHO OFF

COLOR 0A

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::           �ڴ�(RAM)�����ʾV1.0             ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             ���ߣ�Findyou                    ::

:::::::      �汾:V1.0       ʱ�䣺2015.03.25       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

SET packagename=tv.fuzegame.fuzelauncher



:: ��ȡ��Сʱ,��ʽΪ��24Сʱ�ƣ�10��ǰ��0

SET c_time_hour=%time:~0,2%

IF /i %c_time_hour% LSS 10 (

SET c_time_hour=0%time:~1,1%

)

SET logfilename="%~dp0%date:~0,4%%date:~5,2%%date:~8,2%%c_time_hour%%time:~3,2%%time:~6,2%_RAM.txt"

ECHO."�ڴ���Ϣ���" >%logfilename%

:Startscreencap

adb shell procrank >>%logfilename%

CLS

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::            �ڴ���Ϣ�����ʾ                 ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.  PID       Vss      Rss      Pss      Uss  cmdline

FINDSTR /C:"%packagename%" %logfilename%

ping -n 2 127.0.0.1>nul

GOTO Startscreencap