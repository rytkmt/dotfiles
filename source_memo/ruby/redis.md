#### Redisのインスタンス

- `Redis.new(url: Settings.redis.url)`
- `Redis.new(**Settings.sidekiq_redis.to_h)`

#### Redisのキー確認

- `redis.keys`

#### Redisのキーすべて削除

- `redis.flushall`

#### キーの詳細確認

##### タイプの確認

- `redis.type("key_name")`

##### 値の確認

    if value is of type string -> GET <key>
    if value is of type lists -> lrange <key> <start> <end>
    if value is of type sets -> smembers <key>
    if value is of type sorted sets -> ZRANGEBYSCORE <key> <min> <max>
    if value is of type stream -> xread count <count> streams <key> <ID>.

- hash
  - `redis.hgetall(key_name)`
- zset
  - `redis.zrange(key_name, 0, -1)`
