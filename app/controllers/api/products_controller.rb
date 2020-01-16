class Api::ProductsController < ApplicationController

  def all_products_action
    # render "product.json.rb"
    render "all_products.json.jb"
  end

end
