class ProductController < ApplicationController
  allow_unauthenticated_access only: %i[ index show]

  def index
    @products = Product.all
  end

  def show
    @product = Products.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product = Products.find(params[:id])
  end

  def update
    @product = Products.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end


  private
    def set_product
      @product = Product.find(params[:id])
    end

  private
    def product_params
      parmas.expect(product: [ :name ])
    end
end
