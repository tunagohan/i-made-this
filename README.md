# i-made-this
わたしが作ったものを見て！自慢できるSNS

## ブランチ運用方法

| Branch | Rule |
|:-:|:-:|
| master | 直接pushしないこと |
| develop | Heroku運用が始まったら本格稼働 |

今の所 master からブランチ切ってプルリ作ってレビュー後マージする形で
masterブランチ取り込んだ後 heroku push しなければならんので極力レビュー必須で。
そのうちCIとか入れます。

## Versions

### Local

| Name | Version |
|:-:|:-:|
| Ruby | 2.5.1 |
| Rails | 5.2.0 |
| MySQL | 8.0.11 |

### Production

| Name | Version |
|:-:|:-:|
| Ruby | 2.5.1 |
| Rails | 5.2.0 |
| cleardb:ignite | 5.5.56 |

## data design

![](documents/detabase_design.png)

## ローカル環境の立て方(初回)

### ruby のバージョンを確認する

合っていれば次へ

合っていなければrbenv等でインストールしてください

```
$ ruby -v
=> 2.5.1
```

### mysql のバージョンを確認する

5.5.6にいずれ合わせようかなーと思っている

MySQLローカルに入れたくないよって方は藁谷まで(Dockerの環境を構築します)

```
$ mysql --version
=> 8.0.11
```

### bundle Install

```
$ bundle install --path vendor/bundle
```

### env設定

以下を direnv とか .env でいい感じに export してあげてください

```
export MYSQL_ROOT_PASSWORD=
export WEB_PORT=
```

### db設定

```
$ bundle exec rake db:create db:migrate
```

### サーバーを立てる

```
$ bundle exec rails s -b 0.0.0.0 -p $WEB_PORT
```

http://localhost:{port番号}

## Heroku App先

リダイレクト元：https://i-made-this.app/

リダイレクト先：http://i-made-this-app.herokuapp.com/
