# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users , controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'games#index'
  resources :games, only: [:index, :new, :show, :create, :update] do
  	resources :pieces, only: [:update, :show, :create]
  end
  
  # root "example#index" - This line added to verify the testing framework works well
  put 'join_game/:id', :to => 'games#join', :as => :join_game  
 get 'show', :to => 'games#show'                                    
end
