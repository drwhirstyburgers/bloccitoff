Rails.application.routes.draw do

  devise_for :users

  resources :users do
    resources :items, only: [:create, :destroy]
  end

  authenticated :user do
    root 'users#show', as: :authenticated_index
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'
end
