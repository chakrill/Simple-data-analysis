@echo off
echo ========================================
echo   Spend Sense AI - Starting Servers
echo ========================================
echo.

REM Start Backend Server in a new window
echo Starting Backend Server...
start "Spend Sense AI - Backend" cmd /k "cd /d %~dp0backend && if exist ..\.venv\Scripts\activate.bat (call ..\.venv\Scripts\activate.bat) else (if exist venv\Scripts\activate.bat (call venv\Scripts\activate.bat) else (echo Creating virtual environment... && python -m venv venv && call venv\Scripts\activate.bat)) && pip install -q -r requirements.txt && echo. && echo ======================================== && echo   Backend Server Starting... && echo   http://localhost:5000 && echo ======================================== && echo. && python app.py"

REM Wait a moment for backend to start
timeout /t 3 /nobreak >nul

REM Start Frontend Server in a new window
echo Starting Frontend Server...
start "Spend Sense AI - Frontend" cmd /k "cd /d %~dp0frontend && echo. && echo ======================================== && echo   Frontend Server Starting... && echo   http://localhost:3000 && echo ======================================== && echo. && npm start"

echo.
echo ========================================
echo   Both servers are starting!
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo Two new command windows have opened.
echo Keep them open while using the application.
echo.
echo The browser should open automatically to the frontend.
echo.
pause


