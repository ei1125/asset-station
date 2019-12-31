Rails.application.routes.draw do
  get 'incomes/index'

  root "incomes#index"
end
