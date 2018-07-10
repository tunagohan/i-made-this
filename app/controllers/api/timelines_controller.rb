#
# 全ユーザーのタイムラインを表示する部分
# ログイン後一番最初に見える部分
#
class Api::TimelinesController < ApplicationController
  before_action :authenticate_user!

  def item
    timeline = Item.all.where(delete_flag: 0).limit(100)
    render json: { items: timeline }, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: "Not Found" }, status: :not_found
  end
end
