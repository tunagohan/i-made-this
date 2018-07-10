# == Schema Information
#
# Table name: comments
#
#  id          :bigint(8)        not null, primary key
#  commnet     :string(255)      default(""), not null
#  delete_flag :boolean          default(FALSE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :bigint(8)
#
# Indexes
#
#  index_comments_on_item_id  (item_id)
#

class Comment < ApplicationRecord
end
