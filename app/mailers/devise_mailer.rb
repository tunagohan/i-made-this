class DeviseMailer < Devise::Mailer
  layout 'mailer'
  default from: 'no-reply@i-made-this.app'
end
