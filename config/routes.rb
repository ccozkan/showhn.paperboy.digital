require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'pages#home'
  resources :subscriptions, only: [:create]
  get 'unsubscribe/:token', controller: 'unsubscriptions', action: 'show', as: 'unsubscription'
end
