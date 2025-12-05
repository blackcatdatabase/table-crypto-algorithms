-- Auto-generated from feature-modules-mysql.yaml (map@sha1:F2224DD310A34E10A80882FE9641E685E98B51E8)
-- engine: mysql
-- table:  crypto_algorithms_deprecation

-- Algorithms nearing deprecation (status active but deprecation_date set)
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_crypto_algorithms_deprecation AS
SELECT
  id,
  name,
  class,
  status,
  nist_level,
  created_at
FROM crypto_algorithms
WHERE status = 'deprecated'
ORDER BY created_at ASC;

-- Auto-generated from feature-modules-mysql.yaml (map@sha1:F2224DD310A34E10A80882FE9641E685E98B51E8)
-- engine: mysql
-- table:  key_wrapper_layers_pq_readiness_summary

-- One-row PQ readiness snapshot
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_key_wrapper_layers_pq_readiness_summary AS
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

