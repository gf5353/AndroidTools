@ECHO OFF

COLOR 0A

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::          �ֻ�¼��(��׿4.4������)V1.0        ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             ���ߣ�Findyou                    ::

:::::::      �汾:V1.0       ʱ�䣺2014.12.21       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::


::**************�ڴ��޸�Ŀ¼**************************

SET pcDir=C:\Users\%username%\Pictures

SET phoneDir=/sdcard

::**************�ڴ��޸�Ŀ¼**************************

:recordstart

ECHO.[ HELP ] �������裺

ECHO.         1������¼��ʱ��[�س�]

ECHO.         2������ʾ��ʼ¼��

SET /a SCTIME=10

ECHO.

SET /P SCTIME=[ INFO ] ������¼��ʱ��(Ĭ��10S): 

:MyLoop

SET CONFIRM=Findyou

SET /P CONFIRM=[ INFO ] ȷ�Ͽ�ʼ¼�ƣ�[Enter]

IF NOT "%CONFIRM%"=="Findyou" GOTO MyLoop

ECHO.

ECHO.[ EXEC ] ��ʼ¼����Ƶ(Time: %SCTIME%S)

adb shell screenrecord --time-limit %SCTIME% %phoneDir%/screenrecord.mp4



:: ��ȡ��Сʱ,��ʽΪ��24Сʱ�ƣ�10��ǰ��0

SET c_time_hour=%time:~0,2%

IF /i %c_time_hour% LSS 10 (

SET c_time_hour=0%time:~1,1%

)

ECHO.[ INFO ] ¼�ƽ���

ECHO.

ECHO.[ EXEC ] ����¼��������

adb pull %phoneDir%/screenrecord.mp4 "%pcDir%\%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%.mp4"



ECHO.[ EXEC ] ����Ƶ����Ŀ¼

start %pcDir%

adb shell rm %phoneDir%/screenrecord.mp4



:BATend

ECHO.

ECHO.[ INFO ] ��ͣ3���Զ��ر�...

ping -n 3 127.0.0.1>nul