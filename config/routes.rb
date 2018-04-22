require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  resources :suppliers, only: [:index, :create]
  resources :products, only: [:index, :create]

  root to: 'suppliers#index'
end
