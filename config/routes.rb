# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :games, only: [:new, :show, :create]
  # root "example#index" - This line added to verify the testing framework works well
end
