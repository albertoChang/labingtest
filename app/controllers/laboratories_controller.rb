class LaboratoriesController < ApplicationController

  before_action :set_laboratory, only: [:edit, :update, :show, :toggle_status]

  def index
    @laboratories = Laboratory.all
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end
end
