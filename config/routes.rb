Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts do
    resources :comments, only: [:create]
  end
  resources :comments
  resources :likes, only: [:create, :destroy]
end
