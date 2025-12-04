-- Auto-generated from schema-map-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  crypto_algorithms

CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
