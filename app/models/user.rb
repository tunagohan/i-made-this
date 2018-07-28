# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  provider               :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(255)
#  unconfirmed_email      :string(255)
#  username               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_provider              (provider) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid                   (uid) UNIQUE
#

class User < ApplicationRecord

  # loginは email or usernameで構成されている
  attr_accessor :login

  devise :database_authenticatable,         # パスワード暗号化
         :registerable,                     # 登録処理
         :confirmable,                      # メール認証
         :recoverable,                      # パスワードリセット
         :rememberable,                     # User Cookie
         :trackable,                        # User IPなど
         :validatable,                      # バリデーション
         :authentication_keys => [:login]   # username or email login

  validates :username,  uniqueness: true
  validates :email,     uniqueness: true

  belongs_to :user, optional: true

  # 正直よく分かってない
  # 参考元：https://qiita.com/HamaTech/items/8a4694fa40414aa029ea
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
    else
      where(conditions).first
    end
  end
end
