Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :users, only: %i[new create]
  resources :articles, only: %i[new create show edit update destroy],shallow: true do
    resources :comments, only: %i[create destroy]
    collection do
      get articles
    end
  end
end
