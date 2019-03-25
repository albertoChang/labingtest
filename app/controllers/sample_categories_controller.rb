class SampleCategoriesController < ApplicationController

  before_action :set_sample_category, only: [:edit, :update, :show]
  before_action :set_sample_methods, only: [:new, :edit, :update, :show]
  before_action :set_laboratories, only: [:new, :edit, :update, :show]

  def index
    @sample_categories = SampleCategory.per_lab current_user
  end

  def new
    @sample_category = SampleCategory.new
  end

  def create
    @sample_category = SampleCategory.initialize sample_category_params, current_user
    if @sample_category.save
      redirect_to sample_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  private

    def sample_category_params
      params.require(:sample_category).permit(:id, :name, :description, :laboratory_id, sample_category_methods_attributes: sample_category_methods_params)
    end

    def sample_category_methods_params
      [:id, :_destroy, :sample_category_id, :sample_method_id, sample_category_features_attributes: sample_category_feature_params]
    end 

    def sample_category_feature_params
      [:id, :description, :minimun_value, :maximum_value, :_destroy]
    end

    def set_sample_category
      @sample_category = SampleCategory.find params[:id]
    end

    def set_sample_methods
      @sample_methods = SampleMethod.per_lab current_user
    end

    def set_laboratories
      @laboratories = Laboratory.all
    end
end
