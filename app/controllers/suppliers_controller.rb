class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.order(:name).page(params[:page])
  end

  def create
    ImportSuppliersJob.perform_later(params[:file].path)
    redirect_to suppliers_path
  end

end
