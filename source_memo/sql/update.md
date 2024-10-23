## 通常

- `UPDATE テーブル名 SET カラム名 = 値, カラム名2 = 値2 WHERE id = 3`

## 副問合せ

```sql
UPDATE order_deliveries
SET has_free_detail = true
WHERE EXISTS (
  SELECT 1 FROM order_details WHERE order_details.is_free = true AND order_details.order_delivery_id = order_deliveries.id
)
```
