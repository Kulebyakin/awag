Rails.application.routes.draw do
  # get 'warehouse_transfer/new'
  # get 'warehouse_transfer/create'
  # get 'transfer/index'
  # get 'transfer/new'
  # get 'transfer/create'
  root to: "warehouses#index"

  # get 'deliveries/new', to: 'deliveries#new', as: :new_delivery
  # get 'deliveries', to: 'deliveries#index', as: :deliveries

  resources :products
  resources :warehouses do
    resources :deliveries
  end
  resources :warehouse_transfer, only: %i[new create]
  resources :transfer, only: %i[index new create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
