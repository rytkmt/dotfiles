## 通常

- `UPDATE テーブル名 SET カラム名 = 値, カラム名2 = 値2 WHERE id = 3`

## 副問合せによる条件

```sql
UPDATE order_deliveries
SET has_free_detail = true
WHERE EXISTS (
  SELECT 1 FROM order_details WHERE order_details.is_free = true AND order_details.order_delivery_id = order_deliveries.id
)
```

## JOINによる更新値取得

```sql
UPDATE products SET popular_flag = true
FROM reviews -- 実質 INNER JOIN と同じ
WHERE products.id = reviews.product_id; -- ONと同じ

-- postgresではupdateにて下記のようなjoinは使えない https://www.postgresql.jp/document/9.4/html/sql-update.html
-- UPDATE ec_shop_items
-- SET mall_type = ec_shop.mall_type
-- FROM ec_shop_items
-- INNER JOIN ec_shops
-- ON ec_shop_items.ec_shop_id = ec_shops.id
```
