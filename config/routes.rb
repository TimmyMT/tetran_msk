Rails.application.routes.draw do

  get "/customers/black_list_customers", to: "customers#black_list", as: 'bl_customers'
  # patch "/customers/add_black_list_on_phone", to: "customers#add_black_list_on_phone", as: 'add_black_list_on_phone'

  resources :customers do
    member do
      patch :add_to_black_list
      patch :delete_from_black_list
    end

    collection do
      post :add_black_list_on_phone
    end
  end
  root "customers#index"
end
