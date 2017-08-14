class ProductsController < ApplicationController

  def index
    @products = Product.all
    render json: @products
  end

  def show
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def whitelist_params
    params.require(:product).permit(:name)
  end

end
