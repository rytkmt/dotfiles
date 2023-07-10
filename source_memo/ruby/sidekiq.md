## キューの中身を確認

```ruby
queue = Sidekiq::Queue.new("キュー名")
queue.size
queue.first
```

## キューの中のjobを削除

```ruby
queue = Sidekiq::Queue.new("キュー名")
job = queue.to_a[0]
job.delete
```
