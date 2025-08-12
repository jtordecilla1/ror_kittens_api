Rails.application.routes.draw do
  root 'kittens#index'
  resources :kittens
  resources :search, only: [:index, :show]
end
