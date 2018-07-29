# coding: utf-8

sample = [
  '魔法科高校の',
  'こんなのを',
  '作って見ました',
  '私の自慢は',
  '便利な',
  'こういう時に役立つ',
  '綺麗な場所で',
  'いつでもどこでも',
  'そんな感じ',
  'テスト'
]

# 9人のテストユーザーを作成します
100.times do |count|

  # ランダムなタイトルになるように
  titlle = sample[rand(10)] + sample[rand(10)] + sample[rand(10)]
  description = sample[rand(10)] + sample[rand(10)] + sample[rand(10)]

  Item.create(
    user_id:        rand(1..9),
    category_id:    rand(1..5),
    title:          titlle,
    description:    description * rand(5),
    url:            'http://i-made-this.app',
    image:          "/thumbnails/#{rand(1..6)}.jpg",
    good_count:     rand(20),
    delete_flag:    0
  )
end
