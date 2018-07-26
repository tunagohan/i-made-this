# faker
# https://github.com/stympy/faker
require 'faker'

FactoryBot.define do
  pass = Faker::Internet.password(8)

  factory :user do
    username                'i-made-this'
    email                   Faker::Internet.email
    password                pass
    password_confirmation   pass
  end
end
