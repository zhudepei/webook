Rails.application.routes.draw do
  root 'books#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :books, only: %i[index show]
  resources :carts, only: %i[show destroy]
  resources :line_items do
    member do
      post 'plus'
      post 'minus'
    end
  end
end
