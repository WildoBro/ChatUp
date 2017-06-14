Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root 'conversations#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations, only: [:create, :show] do
    resources :messages
  end
end