Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    # get "/products" => "products#products_action"



    # get "/first_product_url" => "products#first_product_action"

    # get "/second_product_url" => "products#second_product_action"

    

    # get "/any_product_url" => "products#any_product_action"

    # get "/any_product_url/:id" => "products#any_product_action"

    get "/products" => "products#index"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
  end

end
