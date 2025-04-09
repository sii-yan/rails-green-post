Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resource :like, only: [:create, :destroy]
    collection do
      get :mypost
    end
  end

  resources :comments, only: %i[create destroy]


  namespace :users do
    resource :profile, only: [:show, :edit, :update], controller: 'profile'
    resource :account, only: :show, controller: 'account'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
