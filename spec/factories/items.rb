# faker
# https://github.com/stympy/faker
require 'faker'

FactoryBot.define do
  factory :item do
    title         Faker::Book.title
    description   Faker::Lorem.characters(255)
    category_id   1
    user_id       1
    url           Faker::Internet.url
    image         Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/image/test_image.png'))
    delete_flags  0
  end
end
