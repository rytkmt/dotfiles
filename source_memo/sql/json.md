## 特定のキーの値にアクセスする演算子 `->>`

```sql
-- {"a":  1, "b": {"c": [1, 2, 3]}, "d": null, "e": true, "f": "hello"}
SELECT value->>'a'
```

`->>` は値をテキスト型にして返すので、WHEREの条件にする際には適切な型にキャストする必要があります。

```sql
SELECT value->>'a'
FROM sample
WHERE (value->>'a')::INT = 1
```

キャストする型

- ::INT
- ::BOOL

## ネストした要素にアクセスする演算子 `->`

```sql
-- {"a":  1, "b": {"c": [1, 2, 3]}, "d": null, "e": true, "f": "hello"}  
SELECT value->'b'->'c'->0 --最初の要素
FROM sample
;
     ?column?
-----------------
1
```

## 要素を除く場合

### 配列 `["a", "b"]`の場合

`value - 'a'` => `["b"]`

`'a'` が元から無い場合は何も変化なし（エラーにならない）

### ハッシュ `{"a": 1, "b": 2}`の場合

`value - 'a'` => `{"b": 2}`

## jsonを全部文字列として判断したい

`value::TEXT LIKE '%hoge%'`
