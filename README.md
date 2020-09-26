## Settings

### 【1】vimrc などを紐付ける

cloneしたものの.vimrc .gvimrc .ctagsが読まれるように  
$HOMEにそれぞれシンボリックリンクを貼る

(windows)

```shell
mklink .vimrc (cloneしたvimrcのpath)
```

(mac/linux)

```shell
ln -s (cloneしたvimrcのpath) .vimrc
```

### 【2】grep用にリンクを貼る(winのみ)

Cドライブの直下に「git_bin」という名前でGitのbinにディレクトリのシンボリックリンクを作成する

```shell
mklink git_bin c:¥Program Files¥Git¥usr¥bin
```

### 【3】タグジャンプようにctagsを入れる

universal ctags を使用する

(linux)

```shell
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure
make
sudo make install
```

### 【4】ctagsを非同期でファイル読み込み時などに更新するためvimprocの設定

(windows)  
http://qiita.com/akase244/items/ce5e2e18ad5883e98a77  
上記の手順通りに設定を行う

### 【5】ctagsの設定ファイル

.ctags.dディレクトリにシンボリックリンクを貼る

(linux)  
HOMEの下に.ctags.dという名前でシンボリックリンクを貼る

### 【6】fontの設定(win)

~~http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html~~  

https://github.com/yuru7/HackGen

よりfontをダウンロード

### 【7】bashrcとbash_profileの読み込み

$HOME/.bash_profileに下記を追加  
source ${gitからcloneしたdotfilesのディレクトリ}/.bash_profile

$HOME/.bashrcに下記を追加  
source ${gitからcloneしたdotfilesのディレクトリ}/.bashrc

### 【8】.gitconfigの設定

$HOMEの下に.gitconfigという名前でシンボリックリンクを貼る  
ローカルなものを作りたい場合は、~/.gitconfig.localで設定ファイルを別途用意

### 【9】vim-ref用のテキストブラウザのインストール

(linux)  
yum install lynx

