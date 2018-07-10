#
# 全ユーザーのタイムラインを表示する部分
# ログイン後一番最初に見える部分
#
class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def index

  end
end
