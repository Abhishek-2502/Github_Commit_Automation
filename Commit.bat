@echo off

:: Change Directory
cd C:\Users\abhis\OneDrive\Desktop\DSA_Java

:check_internet
ping -n 1 8.8.8.8 | find "TTL=" >nul
if errorlevel 1 (
    echo Internet connection not available. Checking again in 10 seconds...
    timeout /t 10
    goto check_internet
)

:: Get the current date and time
for /f "tokens=1-5 delims=/: " %%a in ('echo %date% %time%') do (
    set current_date=%%a-%%b-%%c
    set current_time=%%d%%e
)

:: Combine date and time
set datetime=%current_date%_%current_time%

:: Write the current date and time to readme.md
echo %datetime% > README.md

:: Stage the changes
git add .

:: Commit the changes with a message
git commit -m "Commit1"

:: Push the changes to the remote repository
git push
