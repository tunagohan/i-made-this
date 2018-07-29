#
# 全ユーザーのタイムラインを表示する部分
# ログイン後一番最初に見える部分
#
class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user.id)
    @items = Item
               .where(delete_flag: false)
               .order("created_at DESC")
               .page(params[:page])
               .per(20)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
