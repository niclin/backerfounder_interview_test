Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  devise_for :users

  resources :posts, only: [:index, :show, :new, :create] do
    member do
      patch :upvote
    end
    resources :comments, only: [:create]
  end

  resources :comments, only: [] do
    member do
      patch :upvote
    end
  end

  get '/comments/new/:parent_id', to: 'comments#new', as: :new_comment

  root "posts#index"
end
