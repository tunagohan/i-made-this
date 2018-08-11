Rails.application.routes.draw do
  # トップパス
  root 'top_pages#index'

  # 見て見て
  resources :items

  # 全ユーザーの見てみてが見れるタイムライン
  get 'timeline', to: "timelines#index"

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions',
   omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    # # ログイン
    # get "login", to: "users/sessions#new"
    # post "login", to: "users/sessions#create"
    # # 登録
    # get "sign_up", to: "users/sessions#new"
    # post "sign_up", to: "users/sessions#create"

    # ログアウト
    get "logout", to: "users/sessions#destroy"
    # Twitter セッション
    get "/auth/twitter/callback", to: "users/sessions#create"
  end

  # development時にのみ有効
  if Rails.env.development?
    # メール認証
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
    # デザインガイドライン
    get "guideline", to: "guideline/style_guide#index"
  end
end
