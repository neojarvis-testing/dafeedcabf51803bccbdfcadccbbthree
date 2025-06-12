#!/bin/bash

# Variables
LOCAL_LOG_FILE="/home/coder/project/workspace/access_log_sample.txt"
HDFS_DIR="/home/coder/logs/weblogs"
HIVE_SCRIPT_FILE="/home/coder/project/workspace/create_weblogs_table.hql"

echo "=== Step 1: Creating HDFS directory ==="
hdfs dfs -mkdir -p $HDFS_DIR

echo "=== Step 2: Uploading log file to HDFS ==="
hdfs dfs -put -f $LOCAL_LOG_FILE $HDFS_DIR

echo "=== Step 3: Writing Hive table creation script ==="
cat <<EOF > $HIVE_SCRIPT_FILE
CREATE EXTERNAL TABLE IF NOT EXISTS weblogs (
  ip STRING,
  log_time STRING,
  method STRING,
  url STRING,
  protocol STRING,
  status INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "([^ ]*) - - \\\\[(.*?)\\\\] \\\\\"(\\\\w+) ([^ ]*) ([^ ]*)\\\\\" (\\\\d+)"
)
LOCATION '$HDFS_DIR';
EOF

echo "=== Step 4: Running Hive script to create table ==="
hive -f $HIVE_SCRIPT_FILE

echo "✅ Hive external table 'weblogs' created successfully and pointing to: $HDFS_DIR"
