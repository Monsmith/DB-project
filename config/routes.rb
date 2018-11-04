# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users,
             controller: {registrations: 'registrations'}
  root 'posts#index'

  namespace :admin do
    resources :manage_user
    get '/pdf', to: 'manage_users#pdf'
    root to: 'manage_users#index'
  end
  resources :users, only: %i[show destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: [:create]
  end
end
