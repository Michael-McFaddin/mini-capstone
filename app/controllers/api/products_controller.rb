class Api::ProductsController < ApplicationController

  def index
    @product = Product.all
    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"],
      manual: params["manual"],
      specs: params["specs"]
    )
    @product.save
    render "show.json.jb"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.manual = params[:manual] || @product.manual
    @product.specs = params[:specs] || @product.specs

    @product.save
    render "show.json.jb"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "The entry has been deleted successfully."}
  end

  # def first_product_action
  #   @product = Product.first #hash of product data
  #   render "first_product.json.jb"
  # end

  # def second_product_action
  #   @product = Product.find_by(id: 2)
  #   render "first_product.json.jb"
  # end

  # def any_product_action
  #   product_id = params[:id] #params["id"]
  #   @product = Product.find_by(id: product_id)
  #   render "any_product.json.jb"
  # end

end