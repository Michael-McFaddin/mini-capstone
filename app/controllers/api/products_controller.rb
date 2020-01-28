class Api::ProductsController < ApplicationController

  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("name iLIKE?", "%#{params[:search]}%")
    end

    if params[:discount]
      @products = @products.where("price < ?", 100)
    end

    render "index.json.jb"
  end

  def create
    @product = Product.new(
      name: params["name"],
      price: params["price"],
      images: params["images"], #changed from image_url
      description: params["description"],
      manual: params["manual"],
      specs: params["specs"]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find_by(id: params["id"])
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.images = params[:images] || @product.images #changed from image_url
    @product.description = params[:description] || @product.description
    @product.manual = params[:manual] || @product.manual
    @product.specs = params[:specs] || @product.specs

    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
    
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