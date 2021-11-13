
## vimrc などを紐付ける

cloneしたものの.vimrc .gvimrc .ctagsが読まれるように  
$HOMEにそれぞれシンボリックリンクを貼る

#### windows

```shell
mklink .vimrc {cloneしたvimrcのpath}
```

#### mac/linux

```shell
ln -s {cloneしたvimrcのpath} .vimrc
```

## fontの設定(win)

`http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html`
よりfontをダウンロード

## bashrcとbash_profileの読み込み

$HOME/.bash_profileに下記を追加
```shell
source ${gitからcloneしたdotfilesのディレクトリ}/.bash_profile
```

$HOME/.bashrcに下記を追加
```shell
source ${gitからcloneしたdotfilesのディレクトリ}/.bashrc
```

## .gitconfigの設定

$HOMEの下に.gitconfigという名前でシンボリックリンクを貼る  
ローカルなものを作りたい場合は、~/.gitconfig.localで設定ファイルを別途用意

## ruby

```shell
gem install solargraph
```

#### ターミナルにも適用
https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c
