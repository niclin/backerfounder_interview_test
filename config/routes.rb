Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show, :new, :create] do
    member do
      patch :upvote
    end
    resources :comments, only: [:create]
  end

  get '/comments/new/:parent_id', to: 'comments#new', as: :new_comment

  root "posts#index"
end
