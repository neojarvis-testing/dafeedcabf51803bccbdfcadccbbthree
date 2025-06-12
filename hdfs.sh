CREATE EXTERNAL TABLE weblogs (
  ip STRING,
  timestamp STRING,
  method STRING,
  url STRING,
  protocol STRING,
  status INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
  "input.regex" = "([^ ]*) - - \\[(.*?)\\] \\\"(\\w+) ([^ ]*) ([^ ]*)\\\" (\\d+)"
)
LOCATION '/user/logs/weblogs/';