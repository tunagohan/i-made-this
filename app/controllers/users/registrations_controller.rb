# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_require_params, only: [:create]
  before_action :account_update_require_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  def cancel
    super
  end

  protected

  #
  # 新規登録時以下のパラメータが必須項目となる
  #
  # username:               ユーザー名
  # email:                  メールアドレス
  # password:               パスワード
  # password_confirmation:  パスワード確認
  # remember_me:            ログイン情報を記憶するか
  #
  def sign_up_require_params
    devise_parameter_sanitizer.permit(:sign_up) do | user |
      user.permit(:username, :email, :password, :password_confirmation, :remember_me)
    end
  end

  #
  # アカウント更新時以下のパラメータが必須項目となる
  #
  # username:               ユーザー名
  # email:                  メールアドレス
  # password:               パスワード
  # password_confirmation:  パスワード確認
  # current_password:       現在のパスワード
  #
  def account_update_require_params
    devise_parameter_sanitizer.permit(:account_update) do | user |
      user.permit(:username, :email, :password, :password_confirmation, :current_password)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
