@echo off
echo Starting Spend Sense AI Backend Server...
cd backend

REM Try to use root .venv first, otherwise create one in backend
if exist ..\.venv\Scripts\activate.bat (
    echo Using root virtual environment...
    call ..\.venv\Scripts\activate.bat
) else if exist venv\Scripts\activate.bat (
    echo Using backend virtual environment...
    call venv\Scripts\activate.bat
) else (
    echo Creating virtual environment...
    python -m venv venv
    call venv\Scripts\activate.bat
)

echo Installing dependencies...
pip install -r requirements.txt
echo.
echo Starting Flask server on http://localhost:5000
echo Press Ctrl+C to stop the server
echo.
python app.py
pause





