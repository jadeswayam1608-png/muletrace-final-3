#!/usr/bin/env bash
set -e

echo "=================================================="
echo "  MULETRACE // Money-Mule Ring Detection System   "
echo "=================================================="

echo "[1/3] Checking Python dependencies..."
python3 -c "import pandas, networkx, fastapi, uvicorn, yaml, pydantic, sklearn; print(' Python dependencies verified.')" || {
    echo "Installing requirements..."
    pip install -r requirements.txt
}

echo "[2/3] Checking Demo Data..."
if [ ! -f "data/demo/transactions.csv" ]; then
    echo "Generating synthetic demo dataset..."
    python3 data/make_data.py --seed 42
fi

echo "[3/3] Launching MuleTrace..."
python3 -m uvicorn backend.api:app --host 127.0.0.1 --port 8000 --reload &
BACKEND_PID=$!

cd frontend
if [ ! -d "node_modules" ]; then
    npm install
fi
npm run dev

kill $BACKEND_PID
