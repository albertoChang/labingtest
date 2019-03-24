class SampleMethodsController < ApplicationController

  before_action :set_sample_method, only: [:edit, :update, :show] 

  def index
    @sample_methods = SampleMethod.per_lab current_user
  end

  def new
    @sample_method = SampleMethod.new
  end

  def create
    @sample_method = SampleMethod.initialize sample_method_params, current_user
    if @sample_method.save
      redirect_to sample_methods_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @sample_method.assign_attributes sample_method_params
    if @sample_method.valid
      #Audit.register current_user, @action, @controller, register_status = true
      redirect_to sample_methods_path
    else
      #Audit.register current_user, @action, @controller, register_status = false
      render :edit
    end
  end

  def show
  end

  private

    def sample_method_params
      params.require(:sample_method).permit(:id, :unit_cost, :name, :description, :accreditation)
    end

    def set_sample_method
      @sample_method = SampleMethod.find params[:id]
    end

end
