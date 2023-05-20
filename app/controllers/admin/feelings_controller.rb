class Admin::FeelingsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @feeling = Feeling.new
    @feelings = Feeling.all
  end

  def create
    @feeling = Feeling.new(feeling_params)
    if @feeling.save
      redirect_to admin_feelings_path
    else
      @feelings = Feeling.all
      render :index
    end
  end

  def edit
    @feeling = Feeling.find(params[:id])
  end

  def update
    @feeling = Feeling.find(params[:id])
    if @feeling.update(feeling_params)
      redirect_to admin_feelings_path
    else
      render :edit
    end
  end

  def destroy
    @feeling = Feeling.find(params[:id])
    @feeling.destroy
    redirect_to admin_feelings_path
  end

  private

  def feeling_params
    params.require(:feeling).permit(:feeling)
  end
end
