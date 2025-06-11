#!/bin/bash
echo "🔍 Checking Kafka..."
ps -ef | grep kafka
zookeeper-server-start.sh -daemon /opt/kafka/config/zookeeper.properties

# Create a test topic
kafka-topics.sh --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1 \
  || echo "⚠️ Topic might already exist"

# List topics
kafka-topics.sh --list --bootstrap-server localhost:9092

# Web UI
echo "[ℹ️] Kafka has no default Web UI. You can use Kafka Manager if needed."
