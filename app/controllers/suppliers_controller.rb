class SuppliersController < ApplicationController

  def index
    @suppliers = Supplier.order(:name).page(params[:page])
  end

  def create
    if params[:file].present?
      ImportSuppliersJob.perform_later(params[:file].path)
      flash[:notice] = 'Import was successfully started'
    else
      flash[:alert] = 'File not presented!'
    end
    redirect_to suppliers_path
  end

end
