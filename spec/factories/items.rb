# == Schema Information
#
# Table name: items
#
#  id          :bigint(8)        not null, primary key
#  delete_flag :boolean          default(FALSE), not null
#  description :string(255)
#  good_count  :integer
#  image       :string(255)
#  title       :string(255)      default(""), not null
#  url         :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_items_on_category_id  (category_id)
#  index_items_on_user_id      (user_id)
#

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
