class Api::ProductsController < ApplicationController

  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all #array of contact hashes

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
      name: params[:name],
      price: params[:price],
      # images: params[:images], #changed from image_url
      description: params[:description],
      in_stock: params[:in_stock],
      manual: params[:manual],
      specs: params[:specs],
      supplier_id: params[:supplier_id]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find(params["id"]) #hash of product data
    render "show.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    # @product.images = params[:images] || @product.images #changed from image_url
    @product.description = params[:description] || @product.description
    @product.in_stock = params[:in_stock] || @product.in_stock
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

end