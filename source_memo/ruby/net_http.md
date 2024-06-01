## GET

```ruby
uri = URI(url)
  uri.query = URI.encode_www_form(params)
res = Net::HTTP.get_response(uri)
```

## POST

- matterへの通知は下記のようにしていたが、キレイかは不明

```ruby
  uri = URI.parse(url)
  Net::HTTP.post_form(uri, { payload: params.to_json })
```

- これでできるみたいなので、こっちのほうがキレイかも

```ruby
    response = Net::HTTP.post(
      URI('https://example.jp/path/to/endpoint'),
      { key: 'value' }.to_json,
      'Content-Type' => 'application/json'
    )
```
