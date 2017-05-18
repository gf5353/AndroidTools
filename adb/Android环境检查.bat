@ECHO OFF

ECHO.     :::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.     ::                                             ::

ECHO.     ::              ���Android����                 ::

ECHO.     ::                                             ::

ECHO.     :::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             ���ߣ�Findyou                   ::

:::::::      �汾:V1.0       ʱ�䣺2014.01.03        ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.

Color 0A

ECHO.������������������

ECHO.��    JAVA      ��

ECHO.������������������

::0Ϊ�ɹ���1Ϊ���ɹ���9009 �������

java -version 2>nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    ECHO.     [ ERRO ] ���JAVA����: δ����

    ECHO.     [ INFO ] ��ο�ָ�����û�������

) ELSE (

    ECHO.     [ INFO ] ���JAVA����: ������

    ECHO.     -------------------------------------------------

    java -version 2>java.txt

    FOR /F "delims=" %%a IN ('FINDSTR /I /C:"version" java.txt') DO ( 

    ECHO.     [ INFO ] %%a

    del /a/f/q java.txt

    )

)





ECHO.

ECHO.������������������

ECHO.�� ANDROID_HOME ��

ECHO.������������������

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" |^

find /i "ANDROID_HOME" >NUL && SET noSDK=0 || SET noSDK=1 



IF %noSDK%==1 (

    Color 0D

    ECHO.     [ ERRO ] ���ANDROID������δ����

    ECHO.     [ INFO ] ��ο�ָ�����û�������

) ELSE (

    ECHO.     [ INFO ] ���ANDROID������������

    ECHO.     -------------------------------------------------

    ECHO.     [ INFO ] ANDROID_HOME =

    ECHO.     %ANDROID_HOME%

)



ECHO.

ECHO.������������������

ECHO.��     ADB      ��

ECHO.������������������

adb help 2>nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    SET /a noAdb =1

    ECHO.     [ ERRO ] ���adb������δ����

    ECHO.     [ INFO ] ��ο�ָ�����û�������

) ELSE (

    ECHO.     [ INFO ] ���adb������������

    ECHO.     -------------------------------------------------

    FOR /F "delims=" %%a IN ('adb version') DO ( 

    ECHO.     [ INFO ] %%a

    )

)



ECHO.

ECHO.������������������

ECHO.��     AAPT     ��

ECHO.������������������

aapt v >nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    SET /a noaapt =1

    ECHO.     [ INFO ] δ����aapt����

    ECHO.     [ INFO ] ��ο�ָ�����û�������

) ELSE (

    ECHO.     [ INFO ] ���aapt�������������

    ECHO.     -------------------------------------------------

    aapt v >aapt.txt

    FOR /F "delims=" %%a IN (aapt.txt) DO ( 

    ECHO.     [ INFO ] %%a

    del /a/f/q aapt.txt

    )

)



ECHO.

ECHO.

ECHO.[��������رմ���...]

PAUSE>NUL