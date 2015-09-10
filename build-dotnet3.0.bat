@echo off

@rem
@rem https://gist.github.com/asm256/8f5472657c1675bdc77a
@rem https://support.microsoft.com/en-us/kb/318785
@rem
set CSC_REG_KEY="HKLM\SoftWare\Microsoft\NET Framework Setup\NDP\v3.5"
set CSC_REG_VALUE=InstallPath
for /F "usebackq skip=2 tokens=1-2*" %%A in (`REG QUERY %CSC_REG_KEY% /v %CSC_REG_VALUE% 2^>nul`) do (set CSC_PATH=%%C)
set CSC=%CSC_PATH%csc.exe

set SRCS=Source\IniComment.cs Source\IniFile.cs Source\IniKey.cs Source\IniParser.cs Source\IniSection.cs Source\Properties\AssemblyInfo.cs
set OPTS=/nologo /t:library /out:ExIni.dll /nowarn:1607

"%CSC%" %OPTS% %SRCS%
