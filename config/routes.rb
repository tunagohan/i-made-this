Rails.application.routes.draw do
  root 'top_pages#index'
  get 'items/index'
  get 'items/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
