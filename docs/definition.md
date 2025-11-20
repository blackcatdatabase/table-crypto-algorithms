<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – crypto_algorithms

Catalog of supported cryptographic primitives.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| class | TEXT | NO | — | Algorithm class. | enum: kem, sig, hash, symmetric |
| nist_level | SMALLINT | YES | — | Post-quantum NIST security level, if any. |  |