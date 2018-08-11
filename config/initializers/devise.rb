require 'devise/orm/active_record'

Devise.setup do |config|
  config.secret_key = 'd8d2377b99e47f5f9605f8c0803192be647b76468ffa522fe38d860daeb77c7ab9fb6cd3254d4946d0fb1903428ab9045d2900698de6ada6624fa4298e473635'
  config.mailer_sender = 'no-reply@i-made-this.app'
  config.mailer = 'DeviseMailer'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.confirm_within = 24.hour
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.timeout_in = 30.minutes
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.scoped_views = true
  config.omniauth :twitter, ENV["TWITTER_API_KEY"], ENV["TWITTER_SECRET_KEY"]
end
