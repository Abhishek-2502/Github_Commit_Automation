# Automated Git Commit Script

This script automatically commits changes to a specified Git repository when your PC starts, helping to increase your contributions and maintain your daily streak. 
Follow the steps below to set up and use the script.

## Prerequisites

1. Download and install [Git Bash](https://gitforwindows.org/).

## Setup Steps

### Step 1: Create a GitHub Repository

1. Create a new repository on GitHub.
2. Make the repository private.
3. Add a `README.md` file during the repository creation.

### Step 2: Prepare the Repository

1. Empty the `README.md` file manually.
2. Clone the repository to your local machine using the command:
   ```bash
   git clone <link_of_git_repo>
   ```

### Step 3: Initial Setup

1. Open the command prompt (`cmd`) inside the cloned repository directory.
2. Run the following commands to set up the repository:
   ```bash
   git add .
   git commit -m "Initial setup"
   git push -u origin main
   ```

### Step 4: Configure the Script

1. Download the provided script and save it to your local machine.
2. Copy the path of the cloned repository.
3. Open the script in a text editor and update the path in the script:
   ```batch
   cd C:\Users\abhis\OneDrive\Desktop\DSA_Java
   ```

### Step 5: Set Up the Script to Run on Startup

1. Press `Win+R` to open the Run dialog.
2. Type `shell:common startup` and press Enter. This will open the Startup folder.
3. Copy the script into the Startup folder.

## Script Details

The script performs the following tasks:

1. Changes the directory to the specified repository location.
2. Checks for an active internet connection.
3. Gets the current date and time.
4. Writes the current date and time to `README.md`.
5. Stages the changes.
6. Commits the changes with a predefined message.
7. Pushes the changes to the remote repository.

### Script Code

```batch
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
    set current_date=%%c-%%a-%%b
    set current_time=%%d%%e
)

:: Combine date and time
set datetime=%current_date%_%current_time%

:: Write the current date and time to README.md
echo %datetime% > README.md

:: Stage the changes
git add .

:: Commit the changes with a message
git commit -m "Automated commit on %datetime%"

:: Push the changes to the remote repository
git push
```

By following these steps, the script will run automatically each time your PC starts, committing and pushing any changes made to the `README.md` file.

# Author
Abhishek Rajput
