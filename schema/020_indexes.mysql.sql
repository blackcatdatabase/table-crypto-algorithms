-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  crypto_algorithms

CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status);
