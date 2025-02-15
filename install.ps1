# PowerShell Script for Windows Installation
Write-Host "Welcome to Akshat Setup Installer`n" -ForegroundColor Cyan

# Install Python and Pip
Write-Host "Checking Python and Pip Installation..."
if (-Not (Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Host "Python not found, installing..."
    winget install Python.Python -e
}

# Install Node.js and npm
Write-Host "Checking Node.js Installation..."
if (-Not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Node.js and npm..."
    winget install OpenJS.NodeJS -e
}

# Install FFmpeg
Write-Host "Checking FFmpeg Installation..."
if (-Not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Host "Installing FFmpeg..."
    winget install Gyan.FFmpeg -e
}

# Install Python Dependencies
Write-Host "Installing Python dependencies..."
pip install -U -r requirements.txt

# Collect User Inputs
$api_id = Read-Host "Enter API ID"
$api_hash = Read-Host "Enter API HASH"
$bot_token = Read-Host "Enter BOT TOKEN"
$ownid = Read-Host "Enter OWNER ID"
$mongo_db = Read-Host "Enter MONGO DB URI"
$logger = Read-Host "Enter LOG GROUP ID"
$string_session = Read-Host "Enter STRING SESSION"

# Save Variables to .env File
Write-Host "Saving Configuration..."
@"
API_ID = $api_id
API_HASH = $api_hash
BOT_TOKEN = $bot_token
MONGO_DB_URI = $mongo_db
LOGGER_ID = $logger
STRING_SESSION = $string_session
OWNER_ID = $ownid
"@ | Set-Content .env

Write-Host "`nInstallation Completed! Start the bot by running: `n"
Write-Host "python bot.py" -ForegroundColor Green
