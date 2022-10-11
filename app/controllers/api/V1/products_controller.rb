class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products, status: 200
  end

  def show
    product = Product.find(params[:id])
    if product
      render json: product, status: 200
    else
      render json: {error: "Product not found"}, status: 404
    end
  end

  def create
    product = Product.create(product_params)
    if product
      render json: product, status: 201
    else
      render json: {error: "Product not created"}, status: 400
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    head :no_content, status: 204
  end

  private
  def product_params
    params.require(:product).permit([
      :name, 
      :brand,
      :price,
      :description
    ])
  end
end
