"""
Quick setup verification script
Checks if all required dependencies are installed
"""
import sys
import subprocess

def check_python_version():
    """Check Python version"""
    version = sys.version_info
    if version.major >= 3 and version.minor >= 8:
        print(f"✅ Python {version.major}.{version.minor}.{version.micro} - OK")
        return True
    else:
        print(f"❌ Python {version.major}.{version.minor}.{version.micro} - Need Python 3.8+")
        return False

def check_package(package_name, import_name=None):
    """Check if a Python package is installed"""
    if import_name is None:
        import_name = package_name
    try:
        __import__(import_name)
        print(f"✅ {package_name} - Installed")
        return True
    except ImportError:
        print(f"❌ {package_name} - Not installed")
        return False

def check_node():
    """Check if Node.js is installed"""
    try:
        result = subprocess.run(['node', '--version'], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ Node.js {result.stdout.strip()} - OK")
            return True
        else:
            print("❌ Node.js - Not found")
            return False
    except FileNotFoundError:
        print("❌ Node.js - Not found")
        return False

def check_npm():
    """Check if npm is installed"""
    try:
        result = subprocess.run(['npm', '--version'], capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ npm {result.stdout.strip()} - OK")
            return True
        else:
            print("❌ npm - Not found")
            return False
    except FileNotFoundError:
        print("❌ npm - Not found")
        return False

def main():
    print("=" * 50)
    print("Spend Sense AI - Setup Verification")
    print("=" * 50)
    print()
    
    print("Python Environment:")
    python_ok = check_python_version()
    print()
    
    if python_ok:
        print("Python Packages (Backend):")
        packages = [
            ('Flask', 'flask'),
            ('Flask-CORS', 'flask_cors'),
            ('Pandas', 'pandas'),
            ('OpenPyXL', 'openpyxl'),
            ('ReportLab', 'reportlab'),
            ('NumPy', 'numpy'),
        ]
        all_packages_ok = all(check_package(name, import_name) for name, import_name in packages)
        print()
    else:
        all_packages_ok = False
    
    print("Node.js Environment:")
    node_ok = check_node()
    npm_ok = check_npm()
    print()
    
    print("=" * 50)
    if python_ok and all_packages_ok and node_ok and npm_ok:
        print("✅ All checks passed! You're ready to go.")
        print()
        print("Next steps:")
        print("1. Start backend: cd backend && python app.py")
        print("2. Start frontend: cd frontend && npm start")
    else:
        print("❌ Some checks failed. Please install missing dependencies.")
        print()
        if not python_ok:
            print("Install Python 3.8+ from https://www.python.org/")
        if python_ok and not all_packages_ok:
            print("Install Python packages: cd backend && pip install -r requirements.txt")
        if not node_ok or not npm_ok:
            print("Install Node.js from https://nodejs.org/")
    print("=" * 50)

if __name__ == '__main__':
    main()






