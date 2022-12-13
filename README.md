# 設定ファイルまとめ

## 準備

1. プライベートキーの準備
    - Mac
      - ターミナルアプリケーションにファイルアクセスを付与
      - SSH Agentにプライベートキーを登録
    - Linux
      - キーフォワードを許可してSSHでアクセス

1. homebrewのインストール&パスの一時登録
    - [公式サイト](https://brew.sh/index_ja)
    - `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

1. GitとFishのインストール
    - `brew install git fish asdf`

1. dotfilesリポジトリのダウンロード
    - `git clone git@github.com:totto2727/dotfiles.git`
    
1. fishに入る
    - `cd ~/dotfiles`
    - `fish`

1. 一通りインストール

1. setup.shを実行

1. SSHのプライベートキーを移動

## 旧版

1. 仮想ターミナルアプリケーションにフルファイルアクセスの付与
1. SSHの秘密鍵を用意
   - home直下
   - 後で~/.ssh/keys/に移動
1. homebrew/install.shをコピペして実行
   - XCode関係やらでエラーの出る可能性が高いため、手動でHomebrewを導入
   - Gitのリポジトリもダウンロードされるため、以降はそのリポジトリで操作
1. setupスクリプトを実行

