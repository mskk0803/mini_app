Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'user_sessions/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "games#index"
  resources :games, only: %i[index new create show edit update destroy]
  get  "tags/search" => "tags#search"
end
