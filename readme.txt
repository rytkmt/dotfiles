-- setting --

【1】vimrc などを紐付ける

cloneしたものの.vimrc .gvimrc .ctagsが読まれるように
$HOMEにそれぞれシンボリックリンクを貼る

(windows)
mklink .vimrc (cloneしたvimrcのpath)

(mac)
ln -s (cloneしたvimrcのpath) .vimrc

【2】grep用にリンクを貼る
Cドライブの直下に「git_bin」という名前でGitのbinにディレクトリのシンボリックリンクを作成する

mklink git_bin c:¥Program Files¥Git¥usr¥bin

【3】タグジャンプようにctagsを入れる
https://github.com/universal-ctags/ctags
上記からバイナリ版をダウンロードしパスを通す

【4】ctagsを非同期でファイル読み込み時などに更新するためvimprocの設定

http://qiita.com/akase244/items/ce5e2e18ad5883e98a77
上記の手順通りに設定を行う

【5】ctagsの設定ファイル
.ctagsファイルにシンボリックリンクを貼る
(windows)
HOMEの下にctags.confという名前でシンボリックリンクを貼る

(mac)
HOMEの下に.ctagsという名前でシンボリックリンクを貼る

【6】fontの設定
http://www.rs.tus.ac.jp/yyusa/ricty_diminished.html
よりfontをダウンロード

