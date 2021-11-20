# Docker for atcoder-cli

## Docker イメージの内容
- atcoder-cli + online-judge-tools のインストール

## 利用方法
1. Atcoder 作業用リポジトリを用意する
2. ssh 認証鍵を作成し、公開鍵を github にアップロードする
3. 本リポジトリをクローンする
    ```
    $ git clone git@github.com:ktsn-ht/atcoder-cli-docker-image.git
    $ cd docker-image-builder-for-atcoder-cli
    ```
4. ssh ディレクトリに2.で作成した秘密鍵をコピーする
    ```
    # コピー後のディレクトリ構成
    .
    ├── .gitignore
    ├── Dockerfile
    ├── cpp
    │   ├── main.cpp
    │   └── template.json
    ├── docker-compose.yml
    ├── readme.md
    └── ssh
        ├── config
        └── id_rsa
    ```
5. Docker イメージをビルドしてコンテナを起動後、コンテナに入る
    ```
    $ docker-compose build
    $ docker-compose up -d
    $ docker-compose exec app /bin/bash
    ```
6. Atcoder 作業用リポジトリをクローンする
    ```
    # git clone git@github.com:(作業用リポジトリ)
    ```
7. atcoder-cli と online-judge-tools でログインする
    ```
    # acc login
    # oj login https://beta.atcoder.jp/
    ```
8. コンテナ内で作業をおこなう
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
9.  コンテナを終了する
    ```
    # exit
    $ docker-compose down
    ```
