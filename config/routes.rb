Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create, :destroy]
  end
  mount ActionCable.server => '/cable'
end
