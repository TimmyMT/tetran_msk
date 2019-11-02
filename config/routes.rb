Rails.application.routes.draw do

  get "/customers/black_list_customers", to: "customers#black_list", as: 'bl_customers'

  resources :customers do
    member do
      patch :add_to_black_list
      patch :delete_from_black_list
    end
  end
  root "customers#index"
end
