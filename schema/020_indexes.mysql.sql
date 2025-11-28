-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  crypto_algorithms

CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status);
