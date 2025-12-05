-- Auto-generated from feature-modules-postgres.yaml (map@sha1:A8D58997CBCD2EEE06670B1C02AD89FA65E66F67)
-- engine: postgres
-- table:  crypto_algorithms_deprecation

-- Algorithms nearing deprecation (status active but deprecation_date set)
CREATE OR REPLACE VIEW vw_crypto_algorithms_deprecation AS
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

-- Auto-generated from feature-modules-postgres.yaml (map@sha1:A8D58997CBCD2EEE06670B1C02AD89FA65E66F67)
-- engine: postgres
-- table:  key_wrapper_layers_pq_readiness_summary

-- One-row PQ readiness snapshot
CREATE OR REPLACE VIEW vw_key_wrapper_layers_pq_readiness_summary AS
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

