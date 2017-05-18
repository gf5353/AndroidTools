@ECHO OFF

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.::                                             ::

ECHO.::     Activity启动跳转时间监控 V1.0           ::

ECHO.::                                             ::

ECHO.:::::::::::::::::::::::::::::::::::::::::::::::::

:::::::             作者：Findyou                    ::

:::::::      版本:V1.0       时间：2014.08.25       ::

::::::::::::::::::::::::::::::::::::::::::::::::::::::

ECHO.[ INFO ] 清空日志

adb logcat -c

ECHO.[ INFO ] 监控开始(Ctrl+C结束)

ECHO.[ INFO ] 保存请拷贝输出内容

adb logcat -s ActivityManager|Findstr /C:": Displayed"