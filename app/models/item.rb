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
  validates :user_id, presence: true

  # Categoryモデル
  belongs_to :category, optional: true
  validates :category_id, presence: true

  # Itemに対するバリデーション
  validates :category_id, presence: true
  validates :title, presence: true, length: { in: 1..32 }
  validates :description, presence: true, length: { in: 1..255 }
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  # Item Image
  mount_uploader :image, ImageUploader

  class << self
    def get_item_all
      Item.all.where(delete_flag: 0)
    end

    def get_page_item(param_page)
      Item.where(delete_flag: false)
          .order("created_at DESC")
          .page(param_page)
          .per(20)
    end
  end
end
