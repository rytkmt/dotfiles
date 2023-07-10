## 今のシーケンス値の確認

- o `SELECT last_value FROM member_id_seq;`

- x `SELECT currval('member_id_seq');`
  - nextval関数を実行したセッションでしか取得できない

## 次に付与するシーケンス値の確認（incrementされてしまう）

- `SELECT nextval('member_id_seq');`
