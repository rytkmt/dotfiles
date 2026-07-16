# ローカル開発環境構築手順

ansibleで自動化できるものは `[ansible]`、手動対応が必要なものは `[手動]` と記載。

---

## 事前準備（ansible実行前）

### [手動] dotfilesのclone前の準備

```shell
mkdir ~/git ~/workspace ~/temporary
```

### [手動] .git-credentialsを用意

gitプロジェクトとの疎通時にユーザーIDとパスワードを聞かれるものを `.git-credentials` に保存するようにしているが、パスワードなどを平文で保持することになるので権限は絞っておく

```shell
touch ~/.git-credentials && chmod 600 ~/.git-credentials
```

以下の形式でリポジトリへのアクセス情報を記載する：

```
https://${ユーザー名}:${トークン}@github.com
```

GitLabなど複数ホストがある場合は行を追加する：

```
https://${ユーザー名}:${トークン}@gitlab.example.com
```

### [手動] dotfilesのclone

```shell
cd ~/git
git clone https://github.com/rytkmt/dotfiles.git
```

Username は rytkmt
Password は トークン値

### [手動] 本gitプロジェクト(dotfiles)の.git/config

https://qiita.com/shiro01/items/e886aa1e4beb404f9038 を参考に

```
[remote "origin"]
	url = https://rytkmt:${token}@github.com/rytkmt/dotfiles.git
[user]
  name = rytkmt
  email = r12tkmt@gmail.com
```

### [手動] .zprofile.localの作成

```shell
touch ~/.zprofile.local
```

以下を設定する：

```shell
export XDG_CONFIG_HOME=$HOME/git/dotfiles
export REPOS=$HOME/workspace:$HOME/git
export WORK_MEMO_DIR="${メモディレクトリパス}"
```

元の `.profile` がある場合は必要な内容を転記する。

### [手動] ~/.gitconfigの設定

ローカルのconfigなどもありえるのでincludeでgitの内容を読み込む

```
[include]
  path = ${XDG_CONFIG_HOMEのパス}/.gitconfig
```

仕事などで同じアカウントで色々なgitプロジェクトを扱う場合：

```
[user]
  email = ${仕事メールアドレス}
  name = ${仕事メールアドレスの名前部分}
```

---

## ansibleのインストール

```shell
sudo apt update && sudo apt install -y ansible
```

## ansible実行

```shell
cd ~/git/dotfiles/ansible
ansible-playbook -i inventory/localhost site.yml --ask-become-pass
```

ansibleが自動化する内容（詳細は `ansible_migration_plan.md` 参照）：

- **[ansible] neovim** - 依存パッケージ(`make` `cmake` `gettext` `sendfile`)含めビルド・インストール
- **[ansible] dotfiles シンボリックリンク** - `.bashrc` `.bash_profile` `.zshrc` `.zprofile` `.inputrc` `pandoc` `claude/skills` `claude/rules`
- **[ansible] rust/cargo** - rustup + sheldon + csview
- **[ansible] zsh** - デフォルトシェル変更・補完ファイル取得
- **[ansible] go** - バイナリDL・展開・mmv・pipgreインストール
- **[ansible] node + npm** - nodesource経由・neovim npm package
- **[ansible] deno** - インストールスクリプト実行（`unzip`が必要）
- **[ansible] python** - python3 + pynvim/neovim
- **[ansible] ruby** - rbenv + ruby-build + gem(neovim/solargraph)
- **[ansible] lua** - lua5.1 + luarocks + luacheck
- **[ansible] marksman** - Markdown用LSP
- **[ansible] pandoc** - apt + HackGenフォント + シンボリックリンク

---

## ansible実行後

### [手動] クリップボードの設定

#### wslの場合

1. windows側でlemonadeを入れ、サーバー起動する
2. wsl側で1のexeファイルを、PATHが通っているディレクトリ（`$HOME/.local/bin/` など）に `lemonade` という名前でシンボリックリンクを貼る

#### 仮想環境の場合

- windowsと仮想環境間でlemonadeのサーバー・クライアントで疎通して同期

### [手動] ruby本体のインストール

rbenvのインストール後、rubyバージョンを指定してインストール：

```shell
rbenv install <version>
rbenv global <version>
gem install neovim
```

ターミナルへの適用: https://qiita.com/park-jh/items/4358d2d33a78ec0a2b5c

### [手動] 環境変数の設定

- `WORK_MEMO_DIR` - 仕事関係のメモ用ディレクトリパスを `.zprofile.local` で設定（事前準備で未設定の場合）

---

## 参考

### pandocの使い方

```shell
pandoc input.md -o output.pdf -d ~/.config/pandoc/defaults.yaml --metadata title="タイトル"
```
