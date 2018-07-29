# coding: utf-8

# 9人のテストユーザーを作成します
9.times do |count|
  User.create(
    uid: "00000000000000000#{count}",
    provider: "test",
    email: "imadethis_support#{count}@test.com",
    password: 'password',
    image: "https://s3-ap-northeast-1.amazonaws.com/i-made-this-bag/user_default_icon/user_default_0#{count}.png"
  )
end
