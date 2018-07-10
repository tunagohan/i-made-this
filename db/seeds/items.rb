# coding: utf-8

10.times do | num |
Item.create(title: "テストタイトル#{num}",
            description: "テスト詳細#{num}",
            url: 'https://google.com',
            user_id: 1,
            category_id: Category.find_by(category_name: 'phote').id
            )
end
