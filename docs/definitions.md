# crypto_algorithms

Catalog of supported cryptographic primitives.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| class | mysql: ENUM('kem','sig','hash','symmetric') / postgres: TEXT | NO |  | Algorithm class. (enum: kem, sig, hash, symmetric) |
| created_at | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Catalog insertion timestamp (UTC). |
| id | BIGINT | NO |  | Surrogate primary key. |
| name | VARCHAR(120) | NO |  | Canonical algorithm name (e.g., ML-KEM-768). |
| nist_level | SMALLINT | YES |  | Post-quantum NIST security level, if any. |
| params | mysql: JSON / postgres: JSONB | YES |  | JSON metadata with algorithm-specific parameters. |
| status | mysql: ENUM('active','deprecated','experimental') / postgres: TEXT | NO | active | Lifecycle flag. (enum: active, deprecated, experimental) |
| variant | VARCHAR(80) | YES |  | Optional variant descriptor (hybrid, FIPS profile, etc.). |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_crypto_algorithms | class, name, variant_norm |
| uq_crypto_algorithms_raw | class, name, variant |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_ca_class_status | class,status | CREATE INDEX idx_ca_class_status ON crypto_algorithms (class, status) |
| uq_crypto_algorithms | class,name,variant_norm | UNIQUE KEY uq_crypto_algorithms (class, name, variant_norm) |
| uq_crypto_algorithms_raw | class,name,variant | UNIQUE KEY uq_crypto_algorithms_raw (class, name, variant) |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_crypto_algorithms | class, name, variant_norm |
| uq_crypto_algorithms_raw | class, name, variant |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_ca_class_status | class,status | CREATE INDEX IF NOT EXISTS idx_ca_class_status ON crypto_algorithms (class, status) |
| uq_crypto_algorithms | class,name,variant_norm | CONSTRAINT uq_crypto_algorithms UNIQUE (class, name, variant_norm) |
| uq_crypto_algorithms_raw | class,name,variant | CONSTRAINT uq_crypto_algorithms_raw UNIQUE (class, name, variant) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_crypto_algorithms | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_crypto_algorithms | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
