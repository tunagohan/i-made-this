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
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  location               :string(255)
#  name                   :string(255)
#  nickname               :string(255)
#  provider               :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(255)      not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid                   (uid) UNIQUE
#

class User < ApplicationRecord
  devise :database_authenticatable,         # パスワード暗号化
         :registerable,                     # 登録処理
         :confirmable,                      # メール認証
         :recoverable,                      # パスワードリセット
         :rememberable,                     # User Cookie
         :trackable,                        # User IPなど
         :validatable,                      # バリデーション
         :omniauthable,                     # sns auth
         omniauth_providers: [:twitter]     # twitter login

  validates :email,     uniqueness: true

  belongs_to :user, optional: true

  class << self
    def find_for_oauth(auth)
      user = User.where(uid: auth.uid, provider: auth.provider).first

      unless user
        user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20],
          name:     auth.name,
          nickname: auth.nickname,
          location: auth.location,
          image:    auth.image
        )
      end

      user
    end
  end
  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
