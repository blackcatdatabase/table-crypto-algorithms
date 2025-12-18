-- Auto-generated from schema-views-postgres.yaml (map@sha1:3C365C10BD489376A27944AE10F143E1BE4D3BCF)
-- engine: postgres
-- table:  crypto_algorithms

-- Contract view for [crypto_algorithms]
CREATE OR REPLACE VIEW vw_crypto_algorithms AS
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
