require "sidekiq/web"
require "sidekiq/cron/web"

Rails.application.routes.draw do
  scope :monitoring do
    if Rails.env.production?
      Sidekiq::Web.use Rack::Auth::Basic do |username, password|
        ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_USERNAME"])) &
          ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV["SIDEKIQ_PASSWORD"]))
      end
    end

    mount Sidekiq::Web, at: "/sidekiq"
  end

  root "pages#home"

  resources :subscriptions, only: [:create]
  resources :last_posts, only: [:index], path: "last"
  get "unsubscribe/:token", controller: "unsubscriptions", action: "show", as: "unsubscription"
  get "confirm/:token", controller: "confirm_subscriptions", action: "show", as: "confirm_subscription"

  get "/check.txt", to: proc { [200, {}, ["it_works"]] }
end
