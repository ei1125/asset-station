Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:edit, :update]
  resources :years do
    resources :months, only: [:new, :show, :create, :update, :destroy] do
      resources :income, only: [:create, :update, :destroy]
      resources :expense, only: [:create, :update, :destroy]
    end
  end
end
