# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users,
             controller: {registrations: 'registrations'}
  root 'posts#index'

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :photos, only: [:create]
  end
end
