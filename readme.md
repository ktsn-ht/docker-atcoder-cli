# Docker for atcoder-cli

## Docker イメージの内容
- atcoder-cli + online-judge-tools のインストール

## 利用方法
1. Atcoder 作業用リポジトリを用意する
    ```
    $ mkdir atcoder
    ```
1. 本リポジトリをクローンする
    ```
    $ git clone https://github.com/ktsn-ht/docker-atcoder-cli.git
    $ cd docker-atcoder-cli
    ```
1. Docker イメージをビルドしてコンテナを起動後、コンテナに入る
    ```
    $ docker-compose build
    $ docker-compose up -d
    $ docker-compose exec app /bin/ash
    ```
1. atcoder-cli と online-judge-tools でログインする
    ```
    # acclogin
    # ojlogin
    ```
1. コンテナ内で作業をおこなう
    - 問題を解く
    ```
    # acc new <contest id>
    ```
    - テストする
    ```
    # oj t
    ```
    - 提出する
    ```
    # acc submit
    ```
1.  コンテナを終了する
    ```
    # exit
    $ docker-compose down
    ```
