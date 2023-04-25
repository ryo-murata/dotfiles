# dotfiles

## Required

- MacOSX
- Bash v5

    ```
    brew install bash
    ```

### gpg key作成

[新しい GPG キーを生成する - GitHub Docs](https://docs.github.com/ja/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

## Install

1. 個人情報を設定する

    ```sh
    export GIT_NAME=<GitHubアカウント名>
    export GIT_EMAIL=<GitHub登録メールアドレス>
    export GIT_SIGNINGKEY=<GitHubに登録したGPGキー>
    ```

1. install実行

    ```sh
    curl https://raw.githubusercontent.com/ryo-murata/dotfiles/master/install.sh | $(brew --prefix)/bin/bash
    ```

## Usage

### VS Code ファイル簡単検索

#### fdf

ターミナルからファイル名検索してVS Codeで開くことができます

#### rgf

ターミナルからファイル内検索してVS Codeで開くことができます

### カレントディレクトリ簡単切替

#### ja

`ju`で利用するための、ディレクトリパスを登録できます。

登録したいパスに移動してから`ja`を実行してください。

登録されたパスは`JUMPMARKS`環境変数で指定されたファイルに保存されています。

#### ju

切替えたいディレクトリパスを文字列検索して切り替えることができます。
