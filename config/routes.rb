Rails.application.routes.draw do
  root 'pages#home'
  resources :subscriptions, only: [:create]
  get 'unsubscribe/:token', controller: 'unsubscriptions', action: 'show', as: 'unsubscription'
end
