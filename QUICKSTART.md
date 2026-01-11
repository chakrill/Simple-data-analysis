# Quick Start Guide

## Prerequisites Check

Before starting, ensure you have:
- ✅ Python 3.8 or higher installed
- ✅ Node.js 16 or higher installed
- ✅ npm or yarn package manager

## Windows Quick Start

### Option 1: Using Batch Files (Easiest)

1. **Start Backend Server:**
   - Double-click `start_backend.bat`
   - Wait for "Running on http://127.0.0.1:5000"

2. **Start Frontend (in a new terminal):**
   - Double-click `start_frontend.bat`
   - Browser will open automatically at http://localhost:3000

### Option 2: Manual Setup

#### Backend Setup:
```bash
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
python app.py
```

#### Frontend Setup (in a new terminal):
```bash
cd frontend
npm install
npm start
```

## Create Sample Data (Optional)

To test the application with sample data:

```bash
cd backend
python create_sample_data.py
```

This creates `sample_transaction_data.xlsx` in the backend folder that you can upload.

## Using the Application

1. **Upload File:**
   - Drag and drop an Excel file (.xlsx or .xls)
   - Or click "Select File" to browse

2. **View Dashboard:**
   - Interactive charts and statistics appear automatically
   - Use the month dropdown to filter data

3. **Generate Report:**
   - Select report type (PDF or Excel)
   - Optionally select a month
   - Click "Download Report"

## Troubleshooting

### Backend won't start
- Check Python is installed: `python --version`
- Ensure virtual environment is activated
- Install dependencies: `pip install -r requirements.txt`

### Frontend won't start
- Check Node.js is installed: `node --version`
- Install dependencies: `npm install`
- Clear cache: `npm cache clean --force`

### CORS Errors
- Ensure backend is running on port 5000
- Check backend console for errors
- Verify Flask-CORS is installed

### File Upload Fails
- Check file size (max 16MB)
- Ensure file is .xlsx or .xls format
- Check backend console for error messages

## Excel File Format Tips

Your Excel file should have:
- A date column (named "Date", "Transaction Date", etc.)
- An amount column (named "Amount", "Price", "Cost", etc.)
- Optional: Category/Type column for better analysis

Example structure:
| Date | Amount | Category | Description |
|------|--------|----------|-------------|
| 2024-01-15 | 150.00 | Office | Supplies |
| 2024-01-20 | 500.00 | Travel | Flight |

The application automatically detects these columns!






