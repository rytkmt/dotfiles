
> !!! gitlabではplantumlは展開されない mermaid 推奨

## 矢印

- 実線
  - 名前から名前に `->` で後ろに内容文
  - `Alice -> Bob: Authentication Request`
- 点線
  - 名前から名前に `-->` で後ろに内容文
  - `Bob --> Alice: Authentication Response`

- 自分から自分にすると ぐるっとする

## 登場人物定義

- `タイプ フル名称 as 省略名` で定義する
- 末尾に `#red` や `#99ff99` などを指定すると色付けも可能
- 名称に`()` などを使いたい場合はダブルクォートで囲めば良し

```plantuml
' 参加者(一般的なやつ)
participant Participant as Foo
' 人物
actor       Actor       as Foo1
' 境界
boundary    Boundary    as Foo2
' 制御
control     Control     as Foo3
' 実在物
entity      Entity      as Foo4
' DB
database    Database    as Foo5
' 複数データ
collections Collections as Foo6
' キュー
queue       Queue       as Foo7

Foo -> Foo1 : To actor 
Foo -> Foo2 : To boundary
Foo -> Foo3 : To control
Foo -> Foo4 : To entity
Foo -> Foo5 : To database
Foo -> Foo6 : To collections
Foo -> Foo7: To queue
```

## 条件分岐

```plantuml
alt successful case

    Bob -> Alice: Authentication Accepted

else some kind of failure

    Bob -> Alice: Authentication Failure
    group My own label
    Alice -> Log : Log attack start
        loop 1000 times
            Alice -> Bob: DNS Attack
        end
    Alice -> Log : Log attack end
    end

else Another type of failure

   Bob -> Alice: Please repeat

end
```

## 見出し

- 1行
  - `note left of`、`note right of`、`note over`のいずれかに + `人: メッセージ`
  - `note across`
- 複数行
  - `: メッセージ` ではなく 改行してメッセージで、最後に `end note` をつける

