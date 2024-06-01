## neovimのインストール

- `make` `cmake` `gettext` `sendfile` が入っていないとエラーになった

## bashrcとbash_profileの読み込み

$HOME/.bash_profileに下記を追加
```shell
source ${gitからpath}/.bash_profile
```

$HOME/.bashrcに下記を追加
```shell
source ${gitからpath}/.bashrc
```

## .gitconfigの設定

$HOMEの下に.gitconfigという名前でシンボリックリンクを貼る  
ローカルなものを作りたい場合は、~/.gitconfig.localで設定ファイルを別途用意

```shell
ln -s {cloneしたpath}/.gitconfig .gitconfig
```

## .inputrcの設定

$HOMEの下に.inputrcという名前でシンボリックリンクを貼る  

```shell
ln -s {cloneしたpath}/.inputrc .inputrc
```

## deno

`https://docs.deno.com/runtime/manual/getting_started/installation` よりインストール

- `unzip`が入っていないとエラーになった

## ripgrep

aptでいれる

## go

https://qiita.com/fukazawashun/items/ad1212ca16db2698a576

を参考に

## ruby

```shell
gem install solargraph
```

#### ターミナルにも適用
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c
