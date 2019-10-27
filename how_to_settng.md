
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

## grep用にリンクを貼る(winのみ)

Cドライブの直下に「git_bin」という名前でGitのbinにディレクトリのシンボリックリンクを作成する

```shell
mklink git_bin c:¥Program Files¥Git¥usr¥bin
```

## タグジャンプようにctagsを入れる

`universal ctags` を使用する

#### linux

```shell
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
```

## ctagsを非同期でファイル読み込み時などに更新するためvimprocの設定

#### windows

`http://qiita.com/akase244/items/ce5e2e18ad5883e98a77`
上記の手順通りに設定を行う

## ctagsの設定ファイル
`.ctags.d`ディレクトリにシンボリックリンクを貼る

#### linux

HOMEの下に.ctags.dという名前でシンボリックリンクを貼る

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

## vim-ref用のテキストブラウザのインストール

#### (linux)
yum install lynx

## cocのための設定

nodejsのインストール(`https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim`に記載)

#### mac

```shell
brew install node
curl -sL install-node.now.sh | sh
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```

### 設定に困った際は

```vim
:checkhealth
```

にてcocの状態を確認

### extentions

#### ruby

```shell
gem install solargraph
```

```vim
:CocInstall coc-git coc-json coc-solargraph coc-vimlsp coc-snippets coc-markdownlint
```
