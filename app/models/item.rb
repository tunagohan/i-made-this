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

class Item < ApplicationRecord
  # Userモデル
  belongs_to :user, optional: true
  validates  :user_id, presence: true

  # Categoryモデル
  belongs_to :category, optional: true
  validates  :category_id, presence: true

  # Itemモデル
  validates  :category_id, presence: true
end
