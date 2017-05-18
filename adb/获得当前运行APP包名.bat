@ECHO OFF

COLOR 0A

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::           当前运行的APP包名                 ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             作者：Findyou                   ::

:::::::      版本:V1.0       时间：2014.05.25       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

::**************在此修改目录**************************

SET pcDir=%~dp0



FOR /F "tokens=3 delims= " %%a in ('adb shell dumpsys window^|find "mCurrentFocus"') do (

        FOR /F "tokens=1 delims=}" %%i in ("%%a") do (

        ECHO.[ INFO ] 包名/活动名

        ECHO.[ INFO ] %%i

        )

)

ECHO.

PAUSE