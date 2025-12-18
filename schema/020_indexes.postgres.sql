-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  crypto_algorithms

CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
