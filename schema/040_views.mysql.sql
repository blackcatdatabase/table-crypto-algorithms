-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
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

-- Auto-generated from schema-views-feature-mysql.psd1 (map@mtime:2025-11-20T14:32:27Z)
-- engine: mysql
-- table:  crypto_algorithms_pq_readiness_summary
-- One-row PQ readiness snapshot
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_pq_readiness_summary AS
SELECT
  (SELECT COUNT(*) FROM crypto_algorithms WHERE class='kem' AND status='active' AND nist_level IS NOT NULL) AS active_pq_kems,
  (SELECT COUNT(*) FROM crypto_algorithms WHERE class='sig' AND status='active' AND nist_level IS NOT NULL) AS active_pq_sigs,
  (SELECT COUNT(DISTINCT kw.id)
     FROM key_wrappers kw
     JOIN key_wrapper_layers kwl ON kwl.key_wrapper_id = kw.id
     JOIN crypto_algorithms ca ON ca.id = kwl.kem_algo_id
    WHERE ca.nist_level IS NOT NULL) AS wrappers_with_pq_layers,
  (SELECT COUNT(*)
     FROM signatures s
     JOIN crypto_algorithms ca ON ca.id = s.algo_id
    WHERE ca.class='sig' AND ca.nist_level IS NOT NULL) AS pq_signatures_total;

