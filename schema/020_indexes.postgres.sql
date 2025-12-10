-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  crypto_algorithms

CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status);
