Rails.application.routes.draw do
  devise_for :users
  root "incomes#index"
  resources :users, only: [:edit, :update]
end
