#!/bin/bash
echo "🔍 Checking Airflow..."
airflow db init
# CLI Check
airflow db check || echo "❌ Airflow DB not initialized"

# DAGs list
airflow dags list || echo "❌ Airflow DAG listing failed"

airflow dags list-import-errors

# Web UI
echo "[🌐] Airflow Web UI: http://localhost:8080/proxy/8081/"