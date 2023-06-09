# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
                                 sign_in: 'login',
                                 sign_out: 'logout',
                                 registration: 'signup'
                               },
                     controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                     }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        resources :blarghs, only: [:create, :update, :edit, :destroy] do
          resources :mini_blarghs, only: [:create, :destroy]
        end
      end

      resources :blarghs, only: [:index]

      get '/current_user', to: 'current_user#index'
    end
  end
end
