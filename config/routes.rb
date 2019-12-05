# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'home#index'
  resources :games, only: [:new, :show, :create]
  # root "example#index" - This line added to verify the testing framework works well
end
