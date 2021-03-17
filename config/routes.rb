require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root 'pages#home'
  resources :subscriptions, only: [:create]
  get 'unsubscribe/:token', controller: 'unsubscriptions', action: 'show', as: 'unsubscription'
  get '/check.txt', to: proc { [200, {}, ['it_works']] }
end
