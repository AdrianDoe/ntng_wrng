Rails.application.routes.draw do

  root 'frontpage#index'
  get 'frontpage/index'

  resources :articles, only: [:show, :index]

  namespace :admin do
    resources :articles
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
