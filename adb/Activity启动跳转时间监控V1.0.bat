@ECHO OFF

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::     Activity������תʱ���� V1.0           ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             ���ߣ�Findyou                    ::

:::::::      �汾:V1.0       ʱ�䣺2014.08.25       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.[ INFO ] �����־

adb logcat -c

ECHO.[ INFO ] ��ؿ�ʼ(Ctrl+C����)

ECHO.[ INFO ] �����뿽���������

adb logcat -s ActivityManager|Findstr /C:": Displayed"