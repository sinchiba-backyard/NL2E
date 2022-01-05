# KH Coder in Docker
Docker の KH Coder を提供した
docker-compose up したのち次の複雑な作業をする。
また docker として host タイプのネットワークを使っている事にも注意。

## khcoder のインストール
mysql 8.0.27 対応にしたのでオリジナルに対してパッチが必要。
なお、この mysql はパスワード等セキュリティを甘くしていることに注意。

```
$ git submodule init
$ git submodule update
$ cd KHCoder/khcoder
$ patch -p1 << ../../khcoder.diff
```

## mysql の設定
docker の inspect でみた IP アドレスを使う。
mysql の初期設定をする。khcoder という user 名に
すべての権限を与えているのに注意(どうやればいいかわからなかったので)。

```
$ docker cp mysql.txt nl2e_nl2e_1:/
$ docker inspect nl2e_mysql_1
$ docker exec -it nl2e_nl2e_1 /bin/bash
# mysql --host 172.XX.0.2 -u root -p < mysql.txt
# cd /KHCoder/khcoder/
# /usr/bin/perl ./kh_coder.pl
```

## KH Coder の一旦起動と coder.ini の書き換え
そして一旦  KH Coder を立ち上げると KHCoder/khcoder/config/coder.ini
が作成される。それを少し編集する。特に IP アドレス。
docker の inspect でみた IP アドレスを使う。

```
sql_host      172.30.0.2
```

## チュートリアルをやってみる

```
% mkdir KHCoder/works
% cd KHCoder/works
% wget https://khcoder.net/tutorial_data_3x.zip
% unzip -x tutorial_data_3x.zip
```

![khcoder](khcoder.png)
