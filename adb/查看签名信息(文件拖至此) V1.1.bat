@ECHO OFF

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::             �鿴APKǩ����Ϣ                 ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             ���ߣ�Findyou                   ::

:::::::      �汾:V1.0       ʱ�䣺2014.08.25       ::

:::::::      �汾:V1.1       ʱ�䣺2014.12.13       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

Color 0A

ECHO.

ECHO.[ HELP ] �ɲ鿴RSA��APK��keystoreǩ����Ϣ

SET C_PATH=%~dp0

REM ������ֱ�ӽ�APK��RSA�ļ���bat�ļ���

IF NOT "%1"=="" SET apkorFile=%1

IF "%~x1"==".RSA" GOTO RSAFile

IF "%~x1"==".rsa" GOTO RSAFile

IF "%~x1"==".apk" GOTO APKFile

IF "%~x1"==".APK" GOTO APKFile

IF "%~x1"==".keystore" GOTO KEYSTOREFile

IF "%~x1"==".KEYSTORE" GOTO KEYSTOREFile



Color 0D

ECHO.[ INFO ] ���Ǻ��������Ķ��ưɣ�

ECHO.[ HELP ] �뽫RSA���APK����keystore����Bat�ļ���

GOTO BATend



:KEYSTOREFile

DEL "%C_PATH%%~nx1.txt" 2>nul

ECHO.[ INFO ] INPUT��%apkorFile%

ECHO.[ INFO ] OUT: %C_PATH%%~nx1.txt

ECHO.

keytool -list -v -keystore %apkorFile% > "%C_PATH%%~nx1.txt"

type "%C_PATH%%~nx1.txt"

GOTO BATend



:RSAFile

DEL "%C_PATH%%~n1.RSA.txt" 2>nul

ECHO.[ INFO ] INPUT��%apkorFile%

ECHO.[ INFO ] OUT: %C_PATH%%~n1.RSA.txt

ECHO.

keytool -printcert -file %apkorFile% > "%C_PATH%%~n1.RSA.txt"

type "%C_PATH%%~n1.RSA.txt"

GOTO BATend



:APKFile

ECHO.[ INFO ] INPUT��%apkorFile%

ECHO.[ INFO ] OUT: %C_PATH%%~n1.RSA.txt

RD /S /Q %~n1_META-INF 2>nul

::jar tf %apkorFile%|Findstr "RSA"

::��ѹǩ��Ŀ¼

jar -xf %apkorFile% META-INF

::�غ����ļ���

REN META-INF %~n1_META-INF

::�鿴ǩ���ļ���Ϣ

CD %~n1_META-INF

FOR %%I IN (*.RSA) DO (

    ECHO.[ INFO ] %%I

    ECHO.

    keytool -printcert -file %%I > "%C_PATH%%~n1.RSA.txt"

    type "%C_PATH%%~n1.RSA.txt"

)

CD %~dp1

RD /S /Q %~n1_META-INF 2>nul



:BATend

ECHO.

ECHO.[ EXIT ] ��������رմ���...

PAUSE>nul