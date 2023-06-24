# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show]
      resources :blarghs, except: %i[update edit] do
        resources :mini_blarghs, only: %i[create destroy]
      end
    end
  end
end
