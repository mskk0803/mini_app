Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "games#index"
  # get "/login" =>
  resources :user_sessions, only: %i[new create]
  resources :articles, only: %i[new create show edit update destroy],shallow: true do
  end
end
