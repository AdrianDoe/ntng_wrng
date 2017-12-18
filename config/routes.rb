Rails.application.routes.draw do

  resources :products
  resources :teams
  root 'frontpage#index'
  get 'frontpage/index'

  resources :articles, only: [:show, :index]

  namespace :admin do
    resources :articles
    resources :teams
    resources :products
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
