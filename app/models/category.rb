# == Schema Information
#
# Table name: categories
#
#  id            :bigint(8)        not null, primary key
#  category_name :string(255)      default(""), not null
#  delete_flag   :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  category_id   :integer          default(0), not null
#
# Indexes
#
#  index_categories_on_category_id    (category_id) UNIQUE
#  index_categories_on_category_name  (category_name) UNIQUE
#

class Category < ApplicationRecord
  belongs_to :category, optional: true
  validates  :category_id,   uniqueness: true
  validates  :category_name, uniqueness: true
end
