# Docker for atcoder-cli

## Docker イメージの内容
- atcoder-cli + online-judge-tools のインストール

## 利用方法
1. Atcoder 作業用リポジトリを用意する
2. 本リポジトリをクローンする
    ```
    $ git clone git@github.com:ktsn-ht/atcoder-cli-docker-image.git
    $ cd docker-image-builder-for-atcoder-cli
    ```
3. Docker イメージをビルドしてコンテナを起動後、コンテナに入る
    ```
    $ docker-compose build
    $ docker-compose up -d
    $ docker-compose exec app /bin/bash
    ```
4. Atcoder 作業用リポジトリをクローンする
    ```
    # git clone https://github.com/(作業用リポジトリ)
    ```
5. atcoder-cli と online-judge-tools でログインする
    ```
    # acclogin
    # ojlogin
    ```
6. コンテナ内で作業をおこなう
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
    - push する
    ```
    # git push
    ```
7.  コンテナを終了する
    ```
    # exit
    $ docker-compose down
    ```
