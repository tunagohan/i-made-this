class ApplicationController < ActionController::Base
  # ログイン時のパス
  def after_sign_in_path_for(resource)
    items_path
  end

  # ログアウト時のパス
  def after_sign_out_path_for(resource)
    root_path
  end
end
