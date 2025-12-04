-- Auto-generated from schema-map-mysql.yaml (map@74ce4f4)
-- engine: mysql
-- table:  crypto_algorithms

CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status);
