Rails.application.routes.draw do
  root to: "warehouses#index"

  # get 'deliveries/new', to: 'deliveries#new', as: :new_delivery
  # get 'deliveries', to: 'deliveries#index', as: :deliveries

  resources :products
  resources :warehouses do
    resources :deliveries
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
