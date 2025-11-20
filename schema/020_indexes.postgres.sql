-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  crypto_algorithms
CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
