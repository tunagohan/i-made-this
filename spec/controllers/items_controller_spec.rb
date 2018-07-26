require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET items#index' do
    # user の作成
    let(:user) { build(:user) }
    # itemの作成
    let(:item) { create(:item, user_id: user.id, category_id: Category.find_by(category_name: 'engineer'))}
    # 削除されたitemの作成
    let(:item) { create(:item, delete_flags: 1, user_id: user.id, category_id: Category.find_by(category_name: 'engineer'))}

    # ログイン
    before do
      login_user user
    end

    it "200レスポンスが帰ってくること" do
      get :index
      expect(response).to have_http_status :success
    end
  end
end
