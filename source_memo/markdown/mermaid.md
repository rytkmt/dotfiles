
## 前提

- シーケンス図
  - `sequenceDiagram` を先頭に書く

## 登場人物

- ex `participant KEY as FULLNAME`

- 種別
  - `participant`
  - `actor`
j
## 矢印

- 実線矢印
  - 名前から名前に `->>` で後ろに内容文
  - `Alice -> Bob: Authentication Request`
- 点線矢印
  - 名前から名前に `-->>` で後ろに内容文
  - `Bob --> Alice: Authentication Response`

- 自分から自分にすると ぐるっとする
