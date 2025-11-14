
## クラス図 モデルの関連図書くならコレが一番楽

- ド頭に下記を入れると無駄な箱の下段が出ない
    ```
    ---
      config:
        class:
          hideEmptyMembersBox: true
    ---
    ```
- `classDiagram` を先頭に書く

### 説明

WIP

### 実例

```mermaid
---
  config:
    class:
      hideEmptyMembersBox: true
---
classDiagram

class スマレジ部門:::master
class スマレジ部門グループ:::master
class スマレジ属性:::master
class スマレジ属性項目:::master
class スマレジ自由項目:::master
class スマレジ軽減税率:::master
class スマレジ店舗:::master
class スマレジオプショングループ:::master
classDef master fill:#aaaaee

class スマレジ商品:::product
class スマレジ商品 自由項目値:::product
class スマレジ商品 属性項目値:::product
class スマレジ商品 取扱店舗:::product
class スマレジ商品 価格:::product
class スマレジ商品 在庫引当:::product
classDef product fill:#99ddaa,stroke:#669999
class 紐づけアシストスマレジ商品:::temporary
classDef temporary fill:#c0f0d8,stroke:#88aa99

スマレジ部門グループ "1" --> "*" スマレジ部門
スマレジ軽減税率 "0..1" --> "0..*" スマレジ部門
スマレジ属性 "1" --> "1..*" スマレジ属性項目

スマレジオプショングループ "0..1" --> "1..*" スマレジ商品

スマレジ部門 "1" --> "1" スマレジ商品

BYSKU "1" --> "0..1" スマレジ商品
BYSKU "0..1" --> "0..1" 紐づけアシストスマレジ商品
スマレジ軽減税率 "0..1" --> "0..*" スマレジ商品

実店舗 "0..1" --> "1" 倉庫
実店舗 "0..1" --> "0..*" スマレジ店舗
倉庫 "0..1" --> "0..*" スマレジ店舗

スマレジ店舗 "1" --> "0..*" スマレジ商品 取扱店舗

スマレジ商品 "1" --> "0..*" スマレジ商品 取扱店舗

スマレジ店舗 "1" --> "0..*" スマレジ商品 価格
スマレジオプショングループ "1" --> "0..*" スマレジ商品 取扱店舗
スマレジ商品 "1" --> "0..*" スマレジ商品 価格

スマレジ商品 "1" --> "0..*" スマレジ商品 在庫引当
スマレジ商品 在庫引当 "1" --> "1" スマレジ商品


スマレジ商品 "1" --> "0..*" スマレジ商品 自由項目値
スマレジ自由項目 "1" --> "0..*" スマレジ商品 自由項目値

スマレジ商品 "1" --> "0..*" スマレジ商品 属性項目値
スマレジ属性項目 "1" --> "0..*" スマレジ商品 属性項目値
```

## ER図

### 説明

#### 文法

`<first-entity> [<relationship> <second-entity> : <relationship-label>]`

#### 矢印の両端

Value (left)      Value (right)      Meaning

`|o`                  `o|`             Zero or one
`||`                  `||`             Exactly one
`}o`                  `o{`             Zero or more (no upper limit)
`}|`                  `|{`             One or more (no upper limit)

#### 矢印の真ん中

Value             Meaning

`--`               ID参照
`..`               ID以外の参照

#### 省略

```
erDiagram
    p[Person]
    a["Customer Account"]p ||--o| a : has
```

### 実例

```mermaid
erDiagram

rakuten_genres ||--|{ rakuten_genre_attributes : rakuten_genre_id
rakuten_genre_attributes ||--|{ rakuten_genre_attribute_dictionary_values : rakuten_genre_attribute_id
rakuten_genres ||--|{ rakuten_genre_attribute_dictionary_values : rakuten_genre_id

rakuten_items o|--|{ rakuten_skus : rakuten_item_id
rakuten_items o|--|{ rakuten_item_genre_attributes : rakuten_item_id

rakuten_genre_attributes ||..|{ rakuten_item_genre_attributes : rakuten_genre_attribute_key

rakuten_skus ||--o{ rakuten_sku_genre_attribute_datetime_values : rakuten_sku_id
rakuten_skus ||--o{ rakuten_sku_genre_attribute_number_values : rakuten_sku_id
rakuten_skus ||--o{ rakuten_sku_genre_attribute_text_values : rakuten_sku_id

rakuten_item_genre_attributes ||--o{ rakuten_sku_genre_attribute_datetime_values : rakuten_item_genre_attribute_id
rakuten_item_genre_attributes ||--o{ rakuten_sku_genre_attribute_number_values : rakuten_item_genre_attribute_id
rakuten_item_genre_attributes ||--o{ rakuten_sku_genre_attribute_text_values : rakuten_item_genre_attribute_id
```

## シーケンス図

- シーケンス図
    - `sequenceDiagram` を先頭に書く

### 説明

#### 登場人物

- ex `participant KEY as FULLNAME`

- 種別
    - `participant`
    - `actor`

#### 矢印

- 実線矢印
  - 名前から名前に `->>` で後ろに内容文
  - `Alice -> Bob: Authentication Request`
- 点線矢印
  - 名前から名前に `-->>` で後ろに内容文
  - `Bob --> Alice: Authentication Response`
- 自分から自分にすると ぐるっとする
