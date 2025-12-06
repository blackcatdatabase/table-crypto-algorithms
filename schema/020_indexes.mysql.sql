-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  crypto_algorithms

CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status);
