@ECHO OFF

ECHO.     :::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.     ::                                             ::

ECHO.     ::              检查Android环境                 ::

ECHO.     ::                                             ::

ECHO.     :::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             作者：Findyou                   ::

:::::::      版本:V1.0       时间：2014.01.03        ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.

Color 0A

ECHO.┍┄┄┄┄┄┄┄┑

ECHO.┆    JAVA      ┆

ECHO.┕┄┄┄┄┄┄┈┙

::0为成功，1为不成功，9009 命令不存在

java -version 2>nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    ECHO.     [ ERRO ] 检查JAVA环境: 未配置

    ECHO.     [ INFO ] 请参考指导配置环境变量

) ELSE (

    ECHO.     [ INFO ] 检查JAVA环境: 已配置

    ECHO.     -------------------------------------------------

    java -version 2>java.txt

    FOR /F "delims=" %%a IN ('FINDSTR /I /C:"version" java.txt') DO ( 

    ECHO.     [ INFO ] %%a

    del /a/f/q java.txt

    )

)





ECHO.

ECHO.┍┄┄┄┄┄┄┄┑

ECHO.┆ ANDROID_HOME ┆

ECHO.┕┄┄┄┄┄┄┈┙

reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" |^

find /i "ANDROID_HOME" >NUL && SET noSDK=0 || SET noSDK=1 



IF %noSDK%==1 (

    Color 0D

    ECHO.     [ ERRO ] 检查ANDROID环境：未配置

    ECHO.     [ INFO ] 请参考指导配置环境变量

) ELSE (

    ECHO.     [ INFO ] 检查ANDROID环境：已配置

    ECHO.     -------------------------------------------------

    ECHO.     [ INFO ] ANDROID_HOME =

    ECHO.     %ANDROID_HOME%

)



ECHO.

ECHO.┍┄┄┄┄┄┄┄┑

ECHO.┆     ADB      ┆

ECHO.┕┄┄┄┄┄┄┈┙

adb help 2>nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    SET /a noAdb =1

    ECHO.     [ ERRO ] 检查adb环境：未配置

    ECHO.     [ INFO ] 请参考指导配置环境变量

) ELSE (

    ECHO.     [ INFO ] 检查adb环境：已配置

    ECHO.     -------------------------------------------------

    FOR /F "delims=" %%a IN ('adb version') DO ( 

    ECHO.     [ INFO ] %%a

    )

)



ECHO.

ECHO.┍┄┄┄┄┄┄┄┑

ECHO.┆     AAPT     ┆

ECHO.┕┄┄┄┄┄┄┈┙

aapt v >nul

IF %ERRORLEVEL%==9009 (

    Color 0D

    SET /a noaapt =1

    ECHO.     [ INFO ] 未配置aapt环境

    ECHO.     [ INFO ] 请参考指导配置环境变量

) ELSE (

    ECHO.     [ INFO ] 检查aapt命令环境：已配置

    ECHO.     -------------------------------------------------

    aapt v >aapt.txt

    FOR /F "delims=" %%a IN (aapt.txt) DO ( 

    ECHO.     [ INFO ] %%a

    del /a/f/q aapt.txt

    )

)



ECHO.

ECHO.

ECHO.[按任意键关闭窗口...]

PAUSE>NUL