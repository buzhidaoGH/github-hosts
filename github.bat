%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
if "%1"=="hide" goto CmdBegin
start mshta vbscript:createobject("wscript.shell").run("""%~0"" hide",0)(window.close)&&exit
:CmdBegin
@echo off & setlocal enabledelayedexpansion
set host_file=C:\Windows\System32\drivers\etc\hosts
REM 设置暂存文件
set out_file=out.txt

REM 清空暂存文件内容
cd.>%out_file%

for /f %%t in ('type %host_file% ^| find /c /v ""') do set lines=%%t
set start=0
set end=0
for /l %%i in (1,1,%lines%) do (
    call :G_getrowstr %%i %host_file% temp
    if "!temp!" equ "# GitHub520 Host Start" set start=%%i
    if "!temp!" equ "# GitHub520 Host End" set end=%%i
)

for /f "tokens=1* delims=:" %%a in ('findstr /n .* %host_file%') do (
    if %%a lss %start% (
        if "%%b"=="" (echo.>>%out_file%) else (echo %%b>>%out_file%)
    )
    if %%a gtr %end% (
        if "%%b"=="" (echo.>>%out_file%) else (echo %%b>>%out_file%)
    )
)

for /f "delims=" %%i in ('curl --connect-timeout 2 -m 3 https://raw.fastgit.org/521xueweihan/GitHub520/main/hosts -s') do (
    echo %%i>>%out_file%
)

move /Y %out_file% %host_file%
ipconfig /flushdns
REM del %out_file%
echo %date:~0,10% %time:~0,8% >> host_github.log
exit

:G_getrowstr
set %3=
set /A G_skiprows=%1-1
if "%G_skiprows%"=="0" goto :G_getrowstrz
for /f "skip=%G_skiprows% delims=" %%i in ('findstr /n .* %2') do (
    for /f "tokens=2* delims=:" %%j in ("%%i") do (
        set %3=%%j
    )
goto :eof
)
:G_getrowstrz
for /f "delims=" %%i in ('findstr /n .* %2') do (
for /f "tokens=2* delims=:" %%j in ("%%i") do set %3=%%j
goto :eof
)