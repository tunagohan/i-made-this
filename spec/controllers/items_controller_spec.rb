require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe 'GET #index' do
    # user の作成
    let(:user) { build(:user) }
    # itemの作成
    let(:item) { build(:item, user_id: user.id, category_id: Category.find_by(category_name: 'engineer'))}

    # ログイン
    before do
      login_user user
    end
    it "リクエストが200になっていること" do
      expect(response.status).to eq 200
    end
  end
end
