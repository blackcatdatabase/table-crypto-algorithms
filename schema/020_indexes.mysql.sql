-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  crypto_algorithms

CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status);
