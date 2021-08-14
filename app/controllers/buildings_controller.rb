class BuildingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
    @buildings = Building.all
  end

  def show
    @building = Building.find(params[:id])
    authorize @building
  end

  def new
    @building = Building.new(params[:id])
    authorize @building
  end

  def destroy
    @building = Building.find(params[:id])
    authorize @building
    @building.destroy
    redirect_to new_building_path
  end

  def create
    @building = Building.new(building_params)
    @building.user = current_user
    authorize @building
      if @building.save
        redirect_to building_path(@building)
      else
        render "buildings/new"
      end
  end

  def edit
    @building = Building.find(params[:id])
    authorize @building
    if @building.user != current_user
      redirect_to root_path
    end
  end

  def update
    @building = Building.find(params[:id])
    @building.update(building_params)
    @building.user = current_user
    authorize @building
    if @building.save!
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  private

  def building_params
    params.require(:building).permit(:address, :city, :postal_code, :construction_year)
  end
end
