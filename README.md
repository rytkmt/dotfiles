## Settings

### タグジャンプようにctagsを入れる

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

### ctagsを非同期でファイル読み込み時などに更新するためvimprocの設定

(windows)  
http://qiita.com/akase244/items/ce5e2e18ad5883e98a77  
上記の手順通りに設定を行う

### ctagsの設定ファイル

.ctags.dディレクトリにシンボリックリンクを貼る

(linux)  
HOMEの下に.ctags.dという名前でシンボリックリンクを貼る

### bashrcとbash_profileの読み込み

$HOME/.bash_profileに下記を追加  
source ${gitからcloneしたdotfilesのディレクトリ}/.bash_profile

$HOME/.bashrcに下記を追加  
source ${gitからcloneしたdotfilesのディレクトリ}/.bashrc

### .gitconfigの設定

$HOME/.gitconfigに下記を追加  

```
[include]
  path = /home/vagrant/git/dotfiles/.gitconfig
```

### vim-ref用のテキストブラウザのインストール

(linux)  
yum install lynx
