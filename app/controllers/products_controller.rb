class ProductsController < ApplicationController

  def show
    @products = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end
end
