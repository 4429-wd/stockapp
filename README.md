# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# SROCK-APPの概要
食品の在庫管理の機能と、店舗のスタッフ同士や配送業者の方々とチャットができる機能を組み合わせたアプリです

# アプリを作成した目的
青果店で商品を冷蔵室に搬入するアルバイトをやっている際に、特定の商品だけが異様に在庫を抱えていたり、逆に売り場に出さなければならない商品の在庫が切れているなどの事態がたびたび発生していました。それが食品の在庫管理アプリを作ろうと思ったきっかけです。
ゆくゆくは、食品の在庫管理をしながら店舗のスタッフや商品を搬入する運送業者と連携が取れるツールを作ってみたいと思います。
自動デプロイとして、CircleCIを使用しています。
CircleCIにこのアプリの公開鍵のコードを入力することによりEC2と連携し、さらにGitHubでGitPullをするとデプロイされる仕組みになっています。

# 使用方法・機能
メニュー画面から、５つの
1:在庫
入力した商品と、その在庫の一覧を見る項目。また、在庫数の隣にある更新ボタンを押すと、在庫数のデータを更新するページに飛ぶ。
「新規の在庫数」の項目に更新された在庫数を入力し、「更新する」のボタンを押すと

2:商品追加
新しく入荷された商品とその在庫数を入力する項目。
例）
商品名を入力の項目に「玉ねぎ」、在庫数を入力の項目に「50」と入力し「以上の商品を追加」というボタンを押すと、在庫一覧のに玉ねぎが50個というデータが表示されるようになる。

3:商品取消
販売を取りやめた商品を、在庫一覧から削除するための項目。

4:メアド編集
メールアドレスを変更した際に、新しいアドレスを入力してアドレスのデータを更新することができる。

5:ログアウト
アプリからログアウトする。

※なお、機能は随時追加予定

# リンク
http://3.114.40.165/
テスト用アドレス:testman@gmail.com
テスト用パスワード：testman55

#  STOCKーAPP DB設計
## usersテーブル
|colum|Type|Options|
|-----|----|-------|
|email|string|null: false|
|password|string|null: false|
|store|string|null: false|
|user|string|null: false, index: true|
### Association
-has_many :messages
-has_many :groups, through: :group_users
-has_many :groups_users
-has_many :stocks

## groupsテーブル
|colum|Type|Options|
|-----|----|-------|
|name|string|null: false|
### Association
-has_many :users, through: :groups_users
-has_many :messages
-has_many :groups_users 


## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|text||
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## stocksテーブル
|Column|Type|Options|
|------|----|-------|
|stock|integer|null: false|
|item|string|null: false|
### Association
-belongs_to :user