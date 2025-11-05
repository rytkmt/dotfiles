# gitコマンドメモ

## clone

指定されたディレクトリに元のリポジトリと同じものを複製するコマンド

```
git clone [クローンしたいリポジトリ] [クローン先のディレクトリ(省略可)]
```

クローン先を省略するとクローンしたいリポジトリと同一の名称のディレクトリが生成される

例：

```
$ git clone https://github.com/rytkmt/dotfiles.git
```
---

## init

git管理のための初期化を行うコマンド
対象ディレクトリに`.git`ディレクトリが生成される

```
git init [初期化したいディレクトリ(省略可)]
```

ディレクトリを省略すると、カレントディレクトリとなる

---

## remote

リモートリポジトリを追加・削除・確認・変更するコマンド

追加

```
git remote add [追加するリモートリポジトリ名] [追加したいリポジトリ]
```

削除

```
git remote rm [削除したいリモートリポジトリ名]
```

確認

```
git remote
```

確認(urlも表示)

```
git remote -v
```

変更(url)

```
git remote set-url origin [変更先のURL]
```

変更(リポジトリ名)

```
git remote rename [変更前リポジトリ名] [変更後リポジトリ名]
```

originはデフォルトで使用されるリモートリポジトリ名

例：

```
$ git remote
origin
$ git remote -v
origin	https://github.com/rytkmt/dotfiles.git (fetch)
origin	https://github.com/rytkmt/dotfiles.git (push)
```

---

## status

ワーキングツリーの状態を表示コマンド
下記のファイルのパスをそれぞれ表示する

- ワーキングツリーに追跡されていないもの（まだaddしたことない）
- ワーキングツリーとインデックスに違いがあるもの（addしたものから更に変更がある）
- コミットされたものとインデックスに違いがあるもの（コミットしてからaddされた）

#### オプション
- `--short`  
ファイルパスと、簡略化した状態のマークで表示される

例：
a.txt, b.txt とファイルが有り
aを変更、bを削除、cを作成とした際

```log
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	deleted:    b.txt

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   a.txt

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	c.txt
```

```
$ git status --short
 M a.txt
D  b.txt
?? c.txt
```

---

## diff

ファイルの変更を表示するためのコマンド

下記の
`<commit>` は `HEAD`やらSHA-1の指定のことを意味する

ワーキングツリーとインデックスの差分を表示

```
git diff
```

ワーキングツリーとインデックスの特定のファイルの差分を表示

```
git diff [ファイルパス]
```

ワーキングツリーとコミットとの差分を表示

```
git diff <commit>
```

コミットとコミットの差分を表示

```
git diff <commit> <commit>
```

コミットとコミットの特定のファイルの差分を表示

```
git diff <commit> <commit> [ファイルパス]
```


#### オプション
- `--cached`  
インデックス（ステージ領域）への変更を見るようになる

`<commit>` を省略すると`HEAD`を指す

インデックスとコミットの差分を表示（add/rmされたものの内容確認）

```
git diff --chached <commit>
```


- `--name-only`  
ファイル名だけを比較する
- `-b` or `--ignore-space-changes`  
ファイル内のスペースの数の違いを無視する
- `-w` or `--ignore-all-space`  
ファイル内のスペース/改行コードの違いを完全に無視する

---

## log

コミットのログを表示する

```
$ git log
WARNING: terminal is not fully functional
commit e2d910d83280beb81e9196ce291b1c97437540c4 (HEAD -> master)
Author: rytkmt <r12tkmt@gmail.com>
Date:   Tue Feb 26 14:03:52 2019 +0900

    Mofify a

commit 7ce41173f6dc7312f812102818517d3a658136c7
Merge: d461a70 8c697e8
Author: rytkmt <r12tkmt@gmail.com>
Date:   Tue Feb 26 13:44:48 2019 +0900

    Merge
```

#### オプション
- `--oneline`  
1コミット1行で結果を表示する

```
$ git log --oneline
WARNING: terminal is not fully functional
e2d910d (HEAD -> master) Mofify a
7ce4117 Merge
d461a70 Modify a
8c697e8 (origin/master, origin/HEAD) Add c / Remove b / Modify a
911b9a6 Add b
428dde2 Add a
```

他にもいろいろオプションにて指定できるようなので気になるひとは調べてみてください

---

## add

ワーキングツリーの内容をインデックスに追加するコマンド

ファイルを指定

```
git add [ファイルパス]
```

正規表現でファイルを複数指定

```
git add *.csv
```

変更・削除があったファイルを全てをadd（新しく作られたファイルはaddされない）

```
git add -u
```

新規作成・変更があったファイルを全てadd（削除されたファイルはrmされない）

```
git add .
```

新規作成・変更・削除されたファイルを全てadd

```
git add -A
```

---

## rm

特定のファイルを削除するコマンド
gitの管理から削除した履歴がインデックスに残るため、それをコミットすることリモートリポジトリの管理からも削除できる

ワーキングツリーで変更のないファイルを削除
=> addされたインデックスは削除され、deleteとしてインデックスに追加され、ワーキングツリーからも削除される

```
git rm [ファイルパス]
```


#### オプション

- `-d`  
ディレクトリ毎削除する
- `-f`  
強制的にファイルを削除する。ワーキングツリーにて変更があってもエラーにならない
- `--cached`  
ワーキングツリーからは削除しない（インデックスからの削除、インデックスへの削除としての追加のみ）

---

## mv

ファイルの名称変更、移動のためのコマンド

```
git mv [変更前ファイルパス] [変更後ファイルパス]
```

内部的に下記を行っているよう。そのため間違ってlinuxコマンドの`mv`をしてしまっても安心して大丈夫

1. mv [変更前ファイルパス] [変更後ファイルパス]
2. git add [変更後ファイルパス]
3. git rm [変更前ファイルパス]

---

## commit

インデックスの内容を全てまとめてローカルブランチに反映するコマンド
コミットメッセージを入力するためエディタが開かれる

```
git commit
```

#### オプション

- `-m [メッセージ]` or `--messsage [メッセージ]`  
メッセージをエディタを開かず入力する

- `--amend`
最新のコミットを取り消してインデックスの内容をコミットをやり直す
インデックスに変更が無い場合は、コミットメッセージのみを書き換えることもできる
`-m`と組み合わせることも可

---

## reset

取消を行うコマンド

```
git reset [モード] <commit>
```

`[モード]`は下記を意味し、指定しないときは`--mixed`となる
`--soft` HEADの位置
`--mixed` HEADの位置・インデックス
`--hard` HEADの位置・インデックス・ワーキングツリー

どこの`<commit>`に戻すかを指定する

HEADの位置 はコミットを表す

コミットのみを取り消す（addまでのところに戻せる）

```
git reset --soft HEAD^
```

addしたものを取り消す（ワーキングツリーの変更時点へ戻せる）

```
git reset HEAD
```

コミットを取り消し、addの状態も取り消す（ワーキングツリーの変更時点へ戻せる）

```
git reset HEAD^
```

コミット後の変更を全て消す

```
git reset --hard HEAD
```

昔の状態で動作を確認したい（変更なども消えるため事前にpushしておくのを忘れないように）

```
git reset --hard <commit>
```

リモートリポジトリの状態と全く同じにしたい（先へも進めれる）

```
git reset --hard origin/master
```

---

## push

ローカルリポジトリのコミットの履歴をリモートリポジトリへ送信するコマンド
リモートリポジトリに別のコミット履歴がある場合はエラーとなる（先にpullして競合解決などが必要）

リモートとローカルのブランチ名が同じ場合

```
git push [リポジトリ名] [ブランチ名]
```

リモートとローカルのブランチ名が違う場合

```
git push [リポジトリ名] [ローカルブランチ名]:[リモートブランチ名]
```


ローカルブランチを指定しない場合、リモートリポジトリを削除することができる（空を送信するイメージ）

```
git push [リポジトリ名] :[リモートブランチ名]
```

リモートブランチを削除（明示的）

```
git push --delete [リポジトリ名] [リモートブランチ名]
```



リポジトリ名、ブランチ名を省略した際は、configに設定されている現ローカルブランチの上流ブランチへ送信することとなる
上記が無い場合は、config.defaultのものが採用される。それもなければエラーとなる

#### オプション

- `-u`  
送信したリポジトリ名、ブランチ名を上流ブランチとして設定する

例：

```
git push origin master
```

---

## fetch

リモートリポジトリの内容を、リモート追跡ブランチへ反映するコマンド
もしローカルに該当名称のブランチがなければローカルブランチの作成もされる

指定した名称のブランチをリモートからリモート追跡ブランチへ反映する

```
git fetch [リポジトリ名] [ブランチ名]
```

リモートの全てのブランチをリモート追跡ブランチへ反映する

```
git fetch [リポジトリ名]
```

なければ作成されるというのを使って、別名としてローカルブランチを作る

```
git fetch [リポジトリ名] [リモートブランチ名]:[ローカルブランチ名]
```

---

## show

特定のリビジョンのログを表示する

```
git show <commit>
```

特定のリビジョンの特定のファイルを表示する

```
git show <commit>:<path>
```

## merge

ローカルリポジトリのブランチの内容を、現在のブランチに反映させる

```
git merge [取り込みたいブランチ名]
```


ブランチ名はリモート追跡ブランチも指定できる

取り込むとマージコミットが作成される

**図** ： orangeブランチで `git merge blue` とするときのイメージ
![image.png](https://qiita-image-store.s3.amazonaws.com/0/219776/ff62ff08-1405-6412-82b0-59492475401e.png)

**no-fast-forward**
現在のブランチと取込ブランチのそれぞれにコミットがあった場合
=> マージコミットが自動で行われ、コミットメッセージ編集のためエディターが開かれる

**fast-forward**
現在ブランチの先に取込ブランチがいるだけ（現在ブランチにコミットが無い）の場合
=> マージコミットは不要となる

同じ場所を変更していた場合コンフリクトするため、解消させてマージコミットを行う

#### オプション

- `-m [メッセージ]`  
マージコミットのメッセージをエディターを開かず指定する
- `--no-ff`  
fast-forwardの際もマージコミットを必要とする

例：
コンフリクトの解消

```
$ git merge master2
Auto-merging d.txt
CONFLICT (add/add): Merge conflict in d.txt
Automatic merge failed; fix conflicts and then commit the result.
$ git status --short
AA d.txt
```

```:d.txt
<<<<<<< HEAD
ddd
=======
d
>>>>>>> master2
```

---

## rebase

rebaseは別ブランチのコミットを、特定ブランチのHEADの後ろにもってくるコマンド

これにより、ログとしては一直線の履歴となるためすっきりさせることができる

**図**：現在blueブランチの状態で`git rebase orange`
![image.png](https://qiita-image-store.s3.amazonaws.com/0/219776/adef74d9-0579-0538-03b1-a3858a5ea4d0.png)

#### オプション
- `-i`  
rebaseするブランチ（図のblueブランチ）に複数コミットがある際に、まとめて1つのコミットとして持ってくることができる
エディタが開かれどのコミットをどうまとめるかを指定する
pick: そのままもってくる
squash: 上のコミットにまとめる（押しつぶす）※一番上のコミットはsquashにできない

```:-i
pick 8145f1c Fix screen rotation problem
pick d90db4a v1.2.4
pick 646bf79 Fix screen rotation problem
pick 71a6940 v1.2.4

# Rebase ed7420a..71a6940 onto ed7420a
#
# Commands:
#  p, pick = use commit
#  r, reword = use commit, but edit the commit message
#  e, edit = use commit, but stop for amending
#  s, squash = use commit, but meld into previous commit
#  f, fixup = like "squash", but discard this commit's log message
#  x, exec = run command (the rest of the line) using shell
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
# However, if you remove everything, the rebase will be aborted.
#
```

![image.png](https://qiita-image-store.s3.amazonaws.com/0/219776/ef3a780d-585f-2bb4-bd32-dc5d6e47ce87.png)

`git rebase HEAD~4`など、いまのブランチの複数コミットをまとめることも可能
しかし、それをするとコミットのSHA-1が変更されるためリモートにすでに反映されているものがあると、pushでエラーになるので`git push -f`にて強制送信しなければならなくなる
**`git push -f`は基本的にご法度と言われているのであまりrebaseは使わないほうがよい**

そのほかにも運用により怖いリスクもあるので下記を見ておくべき
[公式: Git のブランチ機能 - リベース ほんとうは怖いリベース](
https://git-scm.com/book/ja/v1/Git-%E3%81%AE%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E6%A9%9F%E8%83%BD-%E3%83%AA%E3%83%99%E3%83%BC%E3%82%B9#%E3%81%BB%E3%82%93%E3%81%A8%E3%81%86%E3%81%AF%E6%80%96%E3%81%84%E3%83%AA%E3%83%99%E3%83%BC%E3%82%B9)

---

## pull

`pull`は内部的に`fetch`と`merge`を行っている
1. `git fetch <repository> <branch>`
2. `git merge FETCH_HEAD`

この際に、fetchしたブランチ名をmergeするために`FETCH_HEAD`という

#### オプション

- `--no-ff`
mergeと同様

---

## branch

ブランチを作成、確認、削除するためのコマンド

ローカルのブランチを表示する

```
git branch
```

リモートのブランチを表示する

```
git branch -r
```

ローカルとリモートのブランチを表示する

```
git branch -a
```

ローカルにブランチを作成する（現在のブランチから）

```
git branch [新しいブランチ名]
```


ローカルからブランチを削除する（HEADにマージされていなければエラー）

```
git branch -d [削除するブランチ名]
```

ローカルからブランチを削除する（HEADにマージ問わず）

```
git branch -D [削除するブランチ名]
```


ブランチ名の変更（変更したいブランチに居る状態で）

```
git branch -m [新しいブランチ名]
```

ブランチ名の変更（変更したいブランチに居ない状態で）

```
git branch -m [古いブランチ名] [新しいブランチ名]
```

---

## checkout

下記の二つの処理をするコマンド

- ①作業ブランチを切り替える
- ②指定したコミット（もしくはインデックス）の状態を、現在の作業ツリーに展開する
- ③特定のファイルのみ指定したコミットの状態に変更する
- ④スタッシュされた特定ファイルのみを作業ツリーに展開する
 
#### ①作業ブランチを切り替える


```
git checkout [ブランチ名]
```


ワーキングツリーのuntrackingファイル（addしていない新しいファイル） と
インデックスの内容（addやrmされたもの）
はそのまま変更したブランチへも引き継がれる。

ブランチを切り替えると、ファイルも全て変更したブランチの状態へと変更される
=> 引き継ぐワーキングツリー、インデックスの内容と競合すると、エラーとなりブランチの切替を中止する

#### ②指定したコミット（もしくはインデックス）の状態を、現在の作業ツリーに展開する


```
git checkout <commit>
```


特定のコミットの状態へ切り替えることができる
が、コミットを指定しているためdetached HEADとなってしまう

#### ③特定のファイルのみ指定したコミットの状態に変更する


```
git checkout <commit> [ファイルパス]
```


HEADが変わるわけではないのでdetached HEADにはならない
該当ファイルが指定コミットの状態でワーキングツリーとインデックスに反映される

```
git checkout .
```

上記は既存ファイル（untracking以外）の変更をHEADの状態へ戻すことができる
untrackingなども考えると、インデックスが空の状態なら`git reset --hard HEAD`を使うほうがよい？かも

#### ④スタッシュされた特定ファイルのみを作業ツリーに展開する

↓xの部分はスタッシュの番号

```
git checkout stash@{x} [ファイルパス]
```

※スタッシュされている内容は消えない

#### オプション

- `-b`  
ブランチの作成、チェックアウトを同時で行う

```
git checkout -b [新しいブランチ名]
```

## stash

ワーキングツリーの変更と、インデックスの内容を退避させておくことができるコマンド
デフォルトでは、untrackingファイルは退避されない

### push

stashに登録?追加?するコマンド

```
git stash push
```

特定のファイルのみを追加する

```
git stash push -- [ファイルパス]
```

#### オプション

- `-p`  
インタラクティブに1ファイルずつ差分が表示されstashさせる対象にするかどうかを選択するモード
- `-k`  
インデックスに登録されている内容はstashをしない
- `-u`  
untrackingファイルもstashする
- `-m [メッセージ]`  
stashにタイトル？説明？を付ける

### list

stashに登録されているものを表示するコマンド

```
$ git stash list
stash@{0}: On master: Add c
stash@{1}: WIP on master: Modify a
```

#### オプション

git logにて使用できるオプションを同じように使える

### show

stashされているものの変更の詳細を表示するコマンド

```
git stash show [stash名]
```

[stash名]は`stash@{0}`など
[stash名]を省略すると、最新のstashが使われる

#### オプション

- `-p`  
変更の内容の詳細まで表示する

### apply

stashに登録された内容をワーキングツリーに反映させるコマンド
デフォルトだと、インデックスに登録された内容もnot staged（ワーキングツリーの変更状態）に戻されてしまう

```
git stash apply [stash名]
```

#### オプション

- `--index`  
インデックスに入った状態で登録されたものはインデックスに反映させる

### drop

stashに登録されたものを削除するコマンド

```
git stash apply [stash名]
```

### pop

applyとdropを合わせたコマンド

```
git stash pop [stash名]
```

#### オプション

- `--index`  
インデックスに入った状態で登録されたものはインデックスに反映させる

### clear

stashに登録された内容を全て削除するコマンド

```
git stash clear
```

### branch

stashに登録された内容を、stashした際のコミットの状態からブランチを作成し、stashの内容をワーキングツリーとインデックスに反映し
stashから削除し、新しいブランチへチェックアウトするコマンド

```
git stash branch [新しいブランチ名] [stash名]
```
