class ProductsController < ApplicationController

  def index
    @products = Product
                  .includes(:supplier)
                  .order(:name)
                  .page(params[:page])
  end

  def create
    if params[:file].present?
      ImportProductsJob.perform_later(params[:file].path)
      flash[:notice] = 'Import was successfully started'
    else
      flash[:alert] = 'File not presented!'
    end
    redirect_to products_path
  end

end
