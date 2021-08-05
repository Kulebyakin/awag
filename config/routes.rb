Rails.application.routes.draw do
  root to: "warehouses#index"

  resources :products
  resources :warehouses do
    resources :deliveries
  end
  resources :warehouse_transfer, only: %i[new create]
  resources :transfer, only: %i[index new create]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
