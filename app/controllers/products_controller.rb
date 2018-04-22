class ProductsController < ApplicationController

  def index
    @products = Product
                  .includes(:supplier)
                  .order(:name)
                  .page(params[:page])
  end

  def create
    ImportProductsJob.perform_later(params[:file].path)
    redirect_to products_path
  end

end
