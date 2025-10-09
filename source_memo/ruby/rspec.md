## rspec-mock

### and_call_original

- `allow(instance).to(receive(:get_product).and_call_original)`

#### 特定のメソッドのみを上書きする場合

- 後勝ちなので全体のモックを先に、特定条件のモックを後に定義

```ruby
allow(instance).to(receive(:get_product).and_call_original)
allow(instance).to(receive(:get_product).with(:hoge).and_return(1))
```

### and_wrap_original

- 元のメソッド実行をまるっと上書きできる

```ruby
allow(instance).to(receive(:get_product).and_wrap_original do |original_method, *args, **params|
  result = original_method.call(*args, **params)
  result[:hoge] = 1
  result
end
```

#### 1回目はand_call_original、2回目はand_raiseさせたい場合

- and_call_originalとand_raiseを両方設定することはできないため、and_wrap_originalで実現する

```ruby
called_count = 0
allow(instance).to(receive(:get_product).and_call_original)
allow(instance).to(receive(:get_product).with(product_id: 8000279).and_wrap_original do |original_method, **params|
  called_count += 1
  if called_count == 1
    original_method.(**params)
  else
    raise(SmaregiApi::ResponseError.new(status: 404, message: "x"))
  end
end)
```
