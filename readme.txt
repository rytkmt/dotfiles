-- setting --

【1】git clone

(1)vimの中にbundleディレクトリを作成する
cd (vimのpath)
mkdir bundle

(2)bundleの中にrytkmtのvim設定もcloneする
cd bundle
git clone https://github.com/rytkmt/vim

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
mklink gvimrc (cloneしたvimrcのpath)




