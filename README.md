# 💰 Spend Sense AI Agent

An intelligent web application for analyzing financial data from Excel files. Upload transactional, logistics, payment, or P-card data and get comprehensive dashboards and downloadable reports.

## Features

- 📊 **Excel File Upload**: Support for .xlsx and .xls files
- 📈 **Interactive Dashboards**: Visual charts and statistics
- 📅 **Month-based Filtering**: Filter data by specific months
- 📄 **Report Generation**: Download PDF or Excel reports
- 🎯 **Smart Data Detection**: Automatically detects date and amount columns
- 💡 **Multiple Data Types**: Handles transactional, logistics, payment, and P-card data

## Tech Stack

### Backend
- Python 3.8+
- Flask (Web framework)
- Pandas (Data processing)
- ReportLab (PDF generation)
- OpenPyXL (Excel processing)

### Frontend
- React 18
- Tailwind CSS (Styling)
- Recharts (Data visualization)
- Axios (HTTP client)

## Installation

### Prerequisites
- Python 3.8 or higher
- Node.js 16 or higher
- npm or yarn

### Backend Setup

1. Navigate to the backend directory:
```bash
cd backend
```

2. Create a virtual environment (recommended):
```bash
python -m venv venv
```

3. Activate the virtual environment:
- Windows:
```bash
venv\Scripts\activate
```
- macOS/Linux:
```bash
source venv/bin/activate
```

4. Install dependencies:
```bash
pip install -r requirements.txt
```

5. Run the Flask server:
```bash
python app.py
```

The backend will run on `http://localhost:5000`

### Frontend Setup

1. Navigate to the frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm start
```

The frontend will run on `http://localhost:3000`

## Usage

1. **Start both servers** (backend and frontend)
2. **Open your browser** and navigate to `http://localhost:3000`
3. **Upload an Excel file** by dragging and dropping or clicking to browse
4. **View the dashboard** with interactive charts and statistics
5. **Filter by month** using the dropdown (if monthly data is available)
6. **Generate reports** by selecting report type (PDF/Excel) and optional month filter
7. **Download reports** with comprehensive analysis

## Excel File Format

The application automatically detects:
- **Date columns**: Looks for columns with names containing "date", "time", "timestamp", etc.
- **Amount columns**: Looks for columns with names containing "amount", "price", "cost", "value", etc.
- **Category columns**: Looks for columns with names containing "category", "type", "description", etc.

### Example Excel Structure:
| Date | Amount | Category | Description |
|------|--------|----------|-------------|
| 2024-01-15 | 150.00 | Office Supplies | Printer Paper |
| 2024-01-20 | 500.00 | Travel | Flight Ticket |
| 2024-02-10 | 200.00 | Office Supplies | Stationery |

## API Endpoints

### POST `/api/upload`
Upload an Excel file for processing.

**Request**: Multipart form data with `file` field

**Response**: JSON with file summary and data preview

### GET `/api/dashboard/<filename>`
Get dashboard data for a specific file.

**Query Parameters**:
- `month` (optional): Filter by specific month (format: YYYY-MM)

**Response**: JSON with dashboard statistics and chart data

### GET `/api/report/<filename>`
Generate and download a report.

**Query Parameters**:
- `type`: Report type (`pdf` or `excel`)
- `month` (optional): Filter by specific month

**Response**: File download (PDF or Excel)

## Project Structure

```
spend-sense-ai/
├── backend/
│   ├── app.py                 # Flask application
│   ├── requirements.txt       # Python dependencies
│   ├── uploads/              # Uploaded files (created automatically)
│   └── reports/              # Generated reports (created automatically)
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   │   ├── FileUpload.js
│   │   │   ├── Dashboard.js
│   │   │   └── ReportGenerator.js
│   │   ├── App.js
│   │   ├── App.css
│   │   ├── index.js
│   │   └── index.css
│   ├── package.json
│   └── tailwind.config.js
└── README.md
```

## Features in Detail

### Dashboard
- **Summary Statistics**: Total amount, average, count, min/max values
- **Monthly Trend Chart**: Line chart showing spending trends over time
- **Category Breakdown**: Bar chart and pie chart for category analysis
- **Top Transactions**: List of highest value transactions

### Reports
- **PDF Reports**: Professional formatted reports with tables and statistics
- **Excel Reports**: Detailed spreadsheets with charts and data breakdowns
- **Month Filtering**: Generate reports for specific months or all data

## Troubleshooting

### Backend Issues
- Ensure Python 3.8+ is installed
- Check that all dependencies are installed: `pip install -r requirements.txt`
- Verify the uploads folder exists and is writable

### Frontend Issues
- Ensure Node.js 16+ is installed
- Clear node_modules and reinstall: `rm -rf node_modules && npm install`
- Check that the backend is running on port 5000

### CORS Issues
- The backend has CORS enabled, but if you encounter issues, check the Flask-CORS configuration in `app.py`

## License

This project is open source and available for use.

## Contributing

Feel free to submit issues and enhancement requests!






