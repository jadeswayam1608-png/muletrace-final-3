@echo off
echo ==================================================
echo   MULETRACE // Money-Mule Ring Detection System   
echo ==================================================

echo [1/3] Checking Python dependencies...
python -c "import pandas, networkx, fastapi, uvicorn, yaml, pydantic, sklearn; print(' Python dependencies verified.')"
if %errorlevel% neq 0 (
    echo Installing requirements...
    python -m pip install -r requirements.txt
)

echo [2/3] Checking Demo Data...
if not exist "data\demo\transactions.csv" (
    echo Generating synthetic demo dataset...
    python data\make_data.py --seed 42
)

echo [3/3] Launching MuleTrace...
start "MuleTrace Backend (FastAPI)" cmd /k "python -m uvicorn backend.api:app --host 127.0.0.1 --port 8000 --reload"
cd frontend
if not exist "node_modules" (
    echo Installing frontend dependencies...
    call npm.cmd install
)
call npm.cmd run dev
