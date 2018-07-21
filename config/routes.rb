Rails.application.routes.draw do
  # トップパス
  root 'top_pages#index'

  # 見て見て
  resources :items

  # 全ユーザーの見てみてが見れるタイムライン
  get 'timeline', to: "timelines#index"

  devise_for :users, controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions'
  }

  devise_scope :user do
    # ログイン
    get "login", to: "users/sessions#new"
    post "login", to: "users/sessions#create"
    # ログアウト
    get "logout", to: "users/sessions#destroy"
    # 登録
    get "sign_up", to: "users/sessions#new"
    post "sign_up", to: "users/sessions#create"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # development時にのみ有効のメール認証
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
