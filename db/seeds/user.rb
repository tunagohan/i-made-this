# coding: utf-8

user = User.new(username: 'admin',
                email:    'imadeapp@info.com',
                password: 'imadeapp')
user.skip_confirmation!
user.save
