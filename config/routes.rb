Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:edit, :update]
  resources :years do
    resources :months, only: [:create, :update, :delete] do
      resources :income, only: [:create, :update, :delete]
      resources :expense, only: [:create, :update, :delete]
    end
  end
end
