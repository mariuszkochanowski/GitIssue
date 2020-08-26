# escape=`
FROM mcr.microsoft.com/windows/servercore:2004

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

COPY InstallGit.ps1 c:\InstallGit.ps1

RUN c:\InstallGit.ps1

RUN Remove-Item c:\InstallGit.ps1

COPY RunTest.bat c:\RunTest.bat

SHELL ["cmd", "/S", "/C" ]

CMD c:\RunTest.bat && cmd