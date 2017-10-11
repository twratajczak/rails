Rails.application.routes.draw do
  post 'users/auth'

  resources :users do
    resources :transfers
  end
end
