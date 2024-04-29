Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :products, only: [:index, :show]
  resources :categories

  resources :shopping_carts, only: [:show, :update]
  delete 'remove_from_cart/:product_id', to: 'shopping_carts#remove', as: 'remove_from_cart'
  put 'update_quantity_cart/:product_id', to: 'shopping_carts#update_quantity', as: 'update_quantity_cart'

  resources :products do
    post 'add_to_cart', on: :member
  end
  get '/cart', to: 'shopping_carts#show'
  #namespace :admin do
   # get 'admin_dashboard', to: 'dashboard#index'
  #end
  get '/about', to: 'pages#about', as: 'about'
  get '/contact', to: 'pages#contact', as: 'contact'

  get '/search_products', to: 'products#search', as: 'search_products'

#get '/categories', to: 'categories#index', as: 'categories'

  get '/products/category/:category_id', to: 'products#category', as: 'products_by_category'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
end
