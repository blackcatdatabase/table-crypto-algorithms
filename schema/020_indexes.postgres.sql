-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  crypto_algorithms
CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
