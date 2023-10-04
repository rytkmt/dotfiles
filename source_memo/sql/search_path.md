## サーチパスの設定

- 文字列でスキーマを単一で指定する
  - `SET search_path = xxx_schema_name;`
- 複数のスキーマを優先度順に指定する
  - `SET search_path TO dev01,public`

## サーチパスの取得

- 全カレントスキーマを取得
  - `SHOW search_path;`

- 複数ある場合は最初のスキーマが表示される
  - `SELECT current_schema();`
    - `"$user"` に関しては解釈後にschema名が変えるっぽい
