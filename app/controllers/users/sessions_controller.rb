# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :login_require_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  #
  # ログイン時以下のパラメータが必須項目となる
  #
  # email:                  メールアドレス
  # password:               パスワード
  # remember_me:            ログイン情報を記憶するか
  #
  def login_require_params
    devise_parameter_sanitizer
      .permit(:sign_up,
              keys: [
                :email,
                :password,
                :remember_me
              ]
      )
  end
end
