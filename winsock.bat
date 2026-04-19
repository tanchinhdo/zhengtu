@echo off

:: --- Tu dong xin quyen admin ---
net session >nul 2>&1
if %errorLevel% neq 0 (
	powershell -Command "Start-Process '%~f0' -Verb runAs"
	exit
)

echo Loading...

netsh winsock reset
netsh int ip reset

echo.
echo Hoan tat! May tinh se khoi dong lai sau 3 giay...

shutdown /r /t 3

pause