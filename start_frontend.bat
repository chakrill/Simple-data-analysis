@echo off
echo Starting Spend Sense AI Frontend...
cd frontend
if not exist node_modules (
    echo Installing dependencies...
    call npm install
)
echo Starting React development server on http://localhost:3000
call npm start
pause






