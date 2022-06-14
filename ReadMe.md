# KH Coder in Docker
Docker の KH Coder を提供した。
docker として host タイプのネットワークを使っている事に注意。

## 必要ファイルのダウンロード

必要なファイル群。

```
$ git clone https://github.com/sinchiba-backyard/NL2E.git
$ cd NL2E
$ git submodule init
$ git submodule update
```

KH Coderを最新版に更新。

```
$ git submodule update --remote
```

チュートリアル用ファイル。

```
$ wget https://khcoder.net/tutorial_data_3x.zip
$ unzip -x tutorial_data_3x.zip -d KHCoder/khcoder/
```

## 起動と設定

```
$ xhost +local:docker
$ docker-compose up
```

xeyesの目玉が表示され、「/usr/sbin/mysqld: ready for connections. Version...」の表示が出れば成功。以降の作業は別ターミナルで。

```
$ /bin/bash do.sh
```

MySQLの設定後、KH Coderが起動する。起動したら[チュートリアル](https://khcoder.net/tutorial.html)を試してみよう。

## 補遺

日常利用のコマンド。一例。

```
$ cd NL2E
$ docker-compose up -d              # dockerコンテナ起動
$ docker-compose ps                 # dockerコンテナ起動確認（任意）
$ docker exec nl2e_nl2e_1 /bin/bash # dockerに入る
# cd /KHCoder/khcoder               # KH Coderのフォルダに移動して
# perl kh_coder.pl                  # KH Coder起動
# exit                              # dockerから出る
$ docker-compose down               # dockerコンテナ終了
```

![khcoder](khcoder.png)
