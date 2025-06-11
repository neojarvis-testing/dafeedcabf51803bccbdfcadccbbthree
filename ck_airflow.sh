#!/bin/bash
echo "🔍 Checking Airflow..."

# CLI Check
airflow db check || echo "❌ Airflow DB not initialized"

# DAGs list
airflow dags list || echo "❌ Airflow DAG listing failed"

# Web UI
echo "[🌐] Airflow Web UI: http://localhost:8080/proxy/8081/"