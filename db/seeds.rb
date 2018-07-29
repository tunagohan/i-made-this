# coding: utf-8

#
# カテゴリとユーザーは何にも紐づいていないため先に作成しても良い
# アイテムはカテゴリとユーザーが存在しなけば作成することができないため最後に読み込ませる必要がある
#

# 1）カテゴリ
load "db/seeds/category.rb"
# 2）ユーザー
load "db/seeds/user.rb"
# 3）アイテム
load "db/seeds/item.rb"
