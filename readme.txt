-- setting --

【1】git clone

(1)vimの中にbundleディレクトリを作成する
cd (vimのpath)
mkdir bundle

(2)bundleの中にrytkmtのvim設定もcloneする
cd bundle
git clone https://github.com/rytkmt/rytkmt_vim_settings.git

(3) bundleの中にneobundleをcloneする
git clone https://github.com/Shougo/neobundle.vim


【2】vimrc などを紐付ける

既存のvimのvimrc,gvimrcのファイル名を変更し退避させ
cloneしたもののvimrc,gvimrcが読まれるようにシンボリックリンクを貼る

(windows)
1.コマンドプロンプトを管理者権限で開く
2.cdでvimの下に移動
3.シンボリックリンクを貼る
mklink vimrc (cloneしたvimrcのpath)
mklink gvimrc (cloneしたgvimrcのpath)

【3】grep用にリンクを貼る
Cドライブの直下に「git_bin」という名前でGitのbinにディレクトリのシンボリックリンクを作成する

mklink git_bin c:¥Program Files¥Git¥usr¥bin

【4】タグジャンプようにctagsを入れる
https://github.com/universal-ctags/ctags
上記からバイナリ版をダウンロードしパスを通す

【5】ctagsを非同期でファイル読み込み時などに更新するためvimprocの設定

http://qiita.com/akase244/items/ce5e2e18ad5883e98a77
上記の手順通りに設定を行う

【6】ctagsの設定ファイル
.ctagsファイルにシンボリックリンクを貼る
(windows)
HOMEの下にctags.confという名前でシンボリックリンクを貼る

(mac)
HOMEの下に.ctagsという名前でシンボリックリンクを貼る
