@echo off
setlocal

powercfg -q 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb > %cd%\val.temp
FOR /F "tokens=4" %%i in ('FIND "AC" val.temp') do @set val=%%i
del %cd%\val.temp
set /a result=val+10
@REM for /f "usebackq" %%i in (`tohex.bat %result%`) do @set result_hex=%%i
@powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb %result%

endlocal

powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e