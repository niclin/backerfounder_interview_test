Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show]

  root "posts#index"
end
