## 環境変数の設定

- WORK_MEMO_DIR
  - 仕事関係のメモ用のディレクトリパスを.bash_profile.localなどで設定する

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

## node + npm

- https://github.com/nodesource/distributions?tab=readme-ov-file#installation-instructions-deb
  - `sudo npm install -g neovim` も実行

## deno

`https://docs.deno.com/runtime/manual/getting_started/installation` よりインストール

- `unzip`が入っていないとエラーになった

## こまごま

- ripgrep
  - aptでいれる
- fd
  - aptで`fd-find`でいれるが、ubuntuだと`fdfind` というコマンド名なので `fd` にシンボリックリンクを貼ってパスを通す
- sqlformat
  - aptでいれる

## python

- aptでpython3を入れる
  - pipが入っていない場合、aptでpython3-pipもいれる
- `sudo python3 -m pip install pynvim neovim`

## go

https://qiita.com/fukazawashun/items/ad1212ca16db2698a576

を参考に

## ruby

### rbenvをインストール

- aptでいれるとrubyの最新バージョン対応していないためcloneする手順より行う
  - https://github.com/rbenv/rbenv?tab=readme-ov-file#basic-git-checkout

- rbenvだけだとrbenv installが実行できない。rbenvの中にruby-buildもインストール必要

```
$ git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

```shell
gem install neovim solargraph
```

#### ターミナルにも適用
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c
