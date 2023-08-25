## スキーマ名の変更

- `ALTER SCHEMA old_name RENAME TO new_name`

## システム系以外のスキーマの取得

- `SELECT schema_name FROM information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'public') AND schema_name NOT LIKE 'pg_%' ORDER BY schema_name;`
  - publicも除いている

## スキーマの削除

- `DROP SCHEMA スキーマ名 CASCADE;`
  - CASCADE は スキーマに含まれるオブジェクト（テーブル、関数など）を自動的に削除します。
