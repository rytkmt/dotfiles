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
