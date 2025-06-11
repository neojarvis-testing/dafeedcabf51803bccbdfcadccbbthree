#!/bin/bash
export HADOOP_NICENESS=0
echo "Starting Hadoop daemons..."
hdfs --daemon start namenode
hdfs --daemon start datanode
hdfs --daemon start secondarynamenode

echo "Hadoop started!"
 
echo "🔍 Checking Hadoop..."
 
# CLI Check
echo "[✔] Listing HDFS root directory:"
hdfs dfs -ls / || echo "❌ HDFS not responding"