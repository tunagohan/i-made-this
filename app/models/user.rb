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
#  description            :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  image                  :string(255)
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  location               :string(255)
#  name                   :string(255)
#  provider               :string(255)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  uid                    :string(255)      not null
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  twitter_id             :string(255)
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
         # :confirmable,                      # メール認証
         :recoverable,                      # パスワードリセット
         :rememberable,                     # User Cookie
         :trackable,                        # User IPなど
         :validatable,                      # バリデーション
         :omniauthable,                     # sns auth
         omniauth_providers: [:twitter]     # twitter login

  class << self
    def from_omniauth(auth)
      find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
        user.provider               = auth["provider"]
        user.uid                    = auth["uid"]
        user.twitter_id             = auth["info"]["nickname"]
        user.name                   = auth["info"]["name"]
        user.location               = auth["info"]["location"]
        user.image                  = auth["info"]["image"]
        user.description            = auth["info"]["description"]
        user.email                  = dummy_email(auth)
        user.password               = Devise.friendly_token[0, 20]
      end
    end

    def new_with_session(params, session)
      if session["devise.user_attributes"]
        new(session["devise.user_attributes"]) do |user|
          user.attributes = params
        end
      else
        super
      end
    end

    private

    def dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end
  end
end
