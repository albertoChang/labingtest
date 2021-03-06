class LaboratoriesController < ApplicationController

  before_action :set_laboratory, only: [:edit, :update, :show, :toggle_status]

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
    @laboratory = Laboratory.new laboratory_params
    if @laboratory.save
      #Audit.register current_user, @action, @controller, register_status = true
      redirect_to laboratories_path
    else
      #Audit.register current_user, @action, @controller, register_status = false
      render :new
    end
  end

  def edit
  end

  def update
    if @laboratory.update_attributes laboratory_params
      #Audit.register current_user, @action, @controller, register_status = true
      redirect_to laboratories_path
    else
      #Audit.register current_user, @action, @controller, register_status = false
      render :edit
    end
  end

  def show
  end

  private

  def laboratory_params
    params.require(:laboratory).permit(:id, :name, :email, :address, :phone, :description)
  end

  def set_laboratory
    @laboratory = Laboratory.find params[:id]
  end
end
