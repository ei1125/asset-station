Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:edit, :update]
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  resources :years do
    collection do
      get 'chart'
    end
    resources :months do
      member do
        get 'money_edit'
      end
      resources :incomes, only: [:index, :create, :update, :destroy]
      resources :expenses, only: [:create, :update, :destroy]
      resources :assets, only: [:create, :update, :destroy]
      resources :debts, only: [:create, :update, :destroy]
      namespace :api do
        resources :inexes, only: :index, defaults: { format: 'json' }
      end
    end
  end
end
