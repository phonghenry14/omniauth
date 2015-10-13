Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  match "/users/:id/finish_signup", to: "users#finish_signup", via: [:get, :patch], as: :finish_signup

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :tasks
    end
  end
end
