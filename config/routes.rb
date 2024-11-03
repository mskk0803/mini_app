Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "games#index"
  # 後で変更
  root "user_sessions#new"
  resources :user_sessions, only: %i[new create]
  resources :articles, only: %i[new create show edit update destroy],shallow: true do
  end
end
