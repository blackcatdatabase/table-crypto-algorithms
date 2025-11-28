-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
-- engine: mysql
-- table:  crypto_algorithms

-- Contract view for [crypto_algorithms]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_crypto_algorithms AS
SELECT
  id,
  class,
  name,
  variant,
  nist_level,
  status,
  params,
  created_at
FROM crypto_algorithms;
