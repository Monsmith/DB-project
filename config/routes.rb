# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users,
             controller: { registrations: 'registrations' }
  root 'posts#index'

  resources :chatrooms do
    resource :chatroom_users
    resources :messages
  end

  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts, only: %i[index show create destroy] do
    resources :photos, only: [:create]
  end

  get 'group', to: 'chatrooms#index'
end
