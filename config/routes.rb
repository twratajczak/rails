Rails.application.routes.draw do
  resources :users do
    resources :transfers
  end
end
