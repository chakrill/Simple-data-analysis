# Spend Sense AI - Start Both Servers
# This script starts both the backend and frontend servers

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Spend Sense AI - Starting Servers" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Get the script directory (project root)
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# Start Backend Server in a new window
Write-Host "Starting Backend Server..." -ForegroundColor Yellow
$backendScript = @"
cd `"$projectRoot\backend`"
if (Test-Path `"$projectRoot\.venv\Scripts\Activate.ps1`") {
    & `"$projectRoot\.venv\Scripts\Activate.ps1`"
} elseif (Test-Path `"$projectRoot\backend\venv\Scripts\Activate.ps1`") {
    & `"$projectRoot\backend\venv\Scripts\Activate.ps1`"
} else {
    Write-Host "Creating virtual environment..." -ForegroundColor Yellow
    python -m venv `"$projectRoot\backend\venv`"
    & `"$projectRoot\backend\venv\Scripts\Activate.ps1`"
}
Write-Host "Installing dependencies..." -ForegroundColor Yellow
pip install -q -r requirements.txt
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Backend Server Starting..." -ForegroundColor Green
Write-Host "  http://localhost:5000" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
python app.py
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $backendScript

# Wait a moment for backend to start
Start-Sleep -Seconds 3

# Start Frontend Server in a new window
Write-Host "Starting Frontend Server..." -ForegroundColor Yellow
$frontendScript = @"
cd `"$projectRoot\frontend`"
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Frontend Server Starting..." -ForegroundColor Green
Write-Host "  http://localhost:3000" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
npm start
"@

Start-Process powershell -ArgumentList "-NoExit", "-Command", $frontendScript

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Both servers are starting!" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Backend:  http://localhost:5000" -ForegroundColor Green
Write-Host "Frontend: http://localhost:3000" -ForegroundColor Green
Write-Host ""
Write-Host "Two new PowerShell windows have opened." -ForegroundColor Yellow
Write-Host "Keep them open while using the application." -ForegroundColor Yellow
Write-Host ""
Write-Host "The browser should open automatically to the frontend." -ForegroundColor Cyan
Write-Host ""
Write-Host "Press any key to exit this window..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


