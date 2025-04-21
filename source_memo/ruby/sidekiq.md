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

## Cronの削除

```ruby
# 実際の積まれたキューの削除
Sidekiq::Queue.new(job_queue_name).each { |job| job.delete }
# キューを積む動きの本体の削除
Sidekiq::Cron::Job.destroy(job_queue_name)
```

## 動いているプロセスの確認

```ruby
require 'sidekiq/api'
Sidekiq::Workers.new.each { puts "Process ID: #{_1}, Thread ID: #{_2}, Job Info: #{_3}" }
```
