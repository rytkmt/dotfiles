## neovimのインストール

- `make` `cmake` `gettext` `sendfile` が入っていないとエラーになった

## bashrcとbash_profileの読み込み

```shell
ln -s {cloneしたpath}/.bashrc ./
ln -s {cloneしたpath}/.bash_profile ./
```

## .bash_profile.local

### XDG_CONFIG_HOMEの設定

```
export XDG_CONFIG_HOME="${dotfilesをcloneしたパス}"
```

### githubにて取得したトークンを設定

```
export GITHUB_API_TOKEN="${トークン}"
```

### .profileが元からあった場合必要なものを転記

何があるかは不明


## 本gitプロジェクト(dotfiles)の.git/config

https://qiita.com/shiro01/items/e886aa1e4beb404f9038 を参考に

```
[remote "origin"]
	url = https://rytkmt:${token}@github.com/rytkmt/dotfiles.git
```

都度入力しなくていいように設定しておく

```
[user]
  name = rytkmt
  email = r12tkmt@gmail.com
```

## .gitconfigの設定

ローカルのconfigなどもありえるのでincludeでgitの内容を読み込む

```shell
[include]
  path = ${XDG_CONFIG_HOMEのパス}/.gitconfig
```

仕事などで
同じアカウントで色々なgitプロジェクトを扱う場合は楽にするためになども設定しておく

```
[user]
  email = ${仕事メールアドレス}
  name = ${仕事メールアドレスの名前部分}
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
