## 今のシーケンス値の確認

- o `SELECT last_value FROM member_id_seq;`

- x `SELECT currval('member_id_seq');`
  - nextval関数を実行したセッションでしか取得できない

## 次に付与するシーケンス値の確認（incrementされてしまう）

- `SELECT nextval('member_id_seq');`

## シーケンス名の変更

- `ALTER SEQUENCE public.import_csv_mapping_definitions_id_seq  RENAME TO import_csv_mappings_id_seq;`
