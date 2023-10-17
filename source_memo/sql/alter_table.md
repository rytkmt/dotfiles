## 列

### 列名の変更

- `ALTER TABLE テーブル名 RENAME 旧カラム名 to 新カラム名;`

### 列の追加

- `ALTER TABLE テーブル名 ADD COLUMN カラム名 データ型;`
  - データ型
    - datetime => timestamp
    - bigint => int8
    - integer => int4
    - string => text
    - boolean => bool
    - date => date

## 制約

### 制約名の変更

- `ALTER TABLE public.import_csv_mapping_definitions RENAME CONSTRAINT import_csv_mapping_definitions_pkey TO import_csv_mappings_pkey;`
