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
  "input.regex" = "([^ ]*) - - \\[(.*?)\\] \\\"(\\w+) ([^ ]*) ([^ ]*)\\\" (\\d+)"
)
LOCATION '/home/coder/logs/weblogs';
