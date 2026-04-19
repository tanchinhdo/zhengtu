@echo off
setlocal enabledelayedexpansion

set DEFENDER="C:\Program Files\Windows Defender\MpCmdRun.exe"

:: Lay danh sach quarantine
%DEFENDER% -ListAll > quarantine.txt

echo === Trang chu www.tanchinhdo.com ===
for /f "tokens=1 delims=," %%A in ('findstr /i "ztgame.exe" quarantine.txt') do (
	set ID=%%A
	echo Restore ID !ID! (ztgame.exe)
	%DEFENDER% -Restore -ID !ID!
)

echo Loading...
for /f "tokens=1 delims=," %%A in ('findstr /i "ztgame.dat" quarantine.txt') do (
	set ID=%%A
	echo Restore ID !ID! (ztgame.dat)
	%DEFENDER% -Restore -ID !ID!
)

del quarantine.txt

echo Successful
pause