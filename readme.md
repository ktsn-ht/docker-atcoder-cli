# Docker for atcoder-cli

## Docker イメージの内容
- github から Atcoder 作業用リポジトリのクローン
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
5. docker-compose.yml を編集する
    ```yml
    version: "3"
      services:
        atcoder-cli:
          build:
            context: .
            args:
              username: (ここに入力)  # input github username you want to use
              reponame: (ここに入力)  # input repository name you want to use
          image: atcoder-cli
          container_name: atcoder-cli
          tty: true
    ```
6. Docker イメージをビルドしてコンテナを起動後、コンテナに入る
    ```
    $ docker-compose up -d --build
    $ docker-compose exec atcoder-cli /bin/bash
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
