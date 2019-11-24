Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  # root "example#index" - This line added to verify the testing framework works well
end
