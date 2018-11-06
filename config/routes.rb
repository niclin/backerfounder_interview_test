Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  get '/comments/new/:parent_id', to: 'comments#new', as: :new_comment

  root "posts#index"
end
