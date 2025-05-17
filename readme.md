# Docker for atcoder-cli

## Docker イメージの内容
- atcoder-cli + online-judge-tools のインストール

## 利用方法
1. Atcoder 作業用リポジトリを用意する
    ```bash
    mkdir atcoder
    ```
1. 本リポジトリをクローンする
    ```bash
    git clone https://github.com/ktsn-ht/docker-atcoder-cli.git
    cd docker-atcoder-cli
    ```
1. Docker イメージをビルドしてコンテナを起動後、コンテナに入る
    ```bash
    docker-compose build
    docker-compose up -d
    docker-compose exec app ash
    ```
1. aclogin コマンドで atcoder-cli と online-judge-tools にログインする
    ```bash
    aclogin
    # ブラウザでAtCoderにログイン、開発者ツールから Cookie の REVEL_SESSION の値をコピペ
    ```
1. コンテナ内で作業をおこなう
    - 問題を解く
    ```bash
    acc new <contest id>
    ```
    - テストする
    ```bash
    oj t
    ```
    - 提出する
    ```bash
    acc submit
    ```
1.  コンテナを終了する
    ```bash
    exit
    docker-compose down
    ```
