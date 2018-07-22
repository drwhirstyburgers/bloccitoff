Rails.application.routes.draw do

  devise_for :users

  root to: "users#show"

  resources :users, only: [:show] do
    resources :items, only: [:create]
  end

  get 'welcome/about'
end
