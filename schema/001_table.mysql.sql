-- Auto-generated from schema-map-mysql.yaml (map@sha1:5E62933580349BE7C623D119AC9D1301A62F03EF)
-- engine: mysql
-- table:  crypto_algorithms

CREATE TABLE IF NOT EXISTS crypto_algorithms (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  class ENUM('kem','sig','hash','symmetric') NOT NULL,
  name VARCHAR(120) NOT NULL,
  variant VARCHAR(80) NULL,
  variant_norm VARCHAR(80) GENERATED ALWAYS AS (IFNULL(variant,'')) STORED,
  nist_level SMALLINT UNSIGNED NULL,
  status ENUM('active','deprecated','experimental') NOT NULL DEFAULT 'active',
  params JSON NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  UNIQUE KEY uq_crypto_algorithms (class, name, variant_norm),
  UNIQUE KEY uq_crypto_algorithms_raw (class, name, variant)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
