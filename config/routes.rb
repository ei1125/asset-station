Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:edit, :update]
  resources :years do
    resources :months do
      resources :incomes, only: [:index, :create, :update, :destroy]
      resources :expenses, only: [:create, :update, :destroy]
      resources :assets, only: [:index,:create, :update, :destroy]
      resources :debts, only: [:create, :update, :destroy]
    end
  end
end
