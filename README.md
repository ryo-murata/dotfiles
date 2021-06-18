# dotfiles

## Required

- MacOSX
- Bash v5
- gcloud
- pinetry

  ```sh
  brew install google-cloud-sdk
  brew install pinentry-mac
  ```

### gpg key作成

[新しい GPG キーを生成する - GitHub Docs](https://docs.github.com/ja/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key)

## Install

1. 個人情報を設定する

  ```sh
  export GIT_NAME=faruryo
  export GIT_EMAIL=faruryo@gmail.com
  export GIT_SIGNINGKEY=6H9G4G8G4F8J2FV0N5B1C6bN5V
  ```

1. install実行

  ```sh
  ./install.sh
  ```
