## neovimのインストール

- `make` `cmake` `gettext` `sendfile` が入っていないとエラーになった

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

## .git-credentialsを用意

gitプロジェクトとの疎通時にユーザーIDとパスワードを聞かれるものを、`.git-credentials` に保存するようにしているが  
パスワードなどを平文で保持することになるので権限は絞っておく

`chmod 600 .git-credentials`

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


## .inputrcの設定

$HOMEの下に.inputrcという名前でシンボリックリンクを貼る  

```shell
ln -s {cloneしたpath}/.inputrc .inputrc
```

## クリップボードの設定

### wslの場合

1. windows側でlemonadeを入れ、サーバー起動する
2. wsl側で1のexeファイルを、PATHが通っているディレクトリ（`$HOME/.local/bin/` など）に `lemonade` という名前でシンボリックリンクを貼る

### 仮想環境の場合

- windowsと仮想環境間でlemonadeのサーバー・クライアントで疎通して同期

## deno

`https://docs.deno.com/runtime/manual/getting_started/installation` よりインストール

- `unzip`が入っていないとエラーになった

## ripgrep

aptでいれる

## go

https://qiita.com/fukazawashun/items/ad1212ca16db2698a576

を参考に

## ruby

### rbenvをインストール

- aptでいれるとrubyの最新バージョン対応していないためcloneする手順より行う
  - https://github.com/rbenv/rbenv?tab=readme-ov-file#basic-git-checkout

```shell
gem install solargraph
```

#### ターミナルにも適用
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c
