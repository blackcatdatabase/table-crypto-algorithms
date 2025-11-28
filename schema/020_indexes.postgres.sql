-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  crypto_algorithms

CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
