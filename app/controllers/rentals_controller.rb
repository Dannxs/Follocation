class RentalsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def new
    @building = Building.find(params[:building_id])
    @rental = Rental.new
    authorize @rental
  end

  def destroy
    @rental = Rental.find(params[:id])
    authorize @rental
    @rental.destroy
    redirect_to new_rental_path
  end

  def create
    @rental = Rental.new(rental_params)
    @building = Building.find(params[:building_id])
    @rental.building = @building
    @rental.user = current_user
    authorize @rental
      if @rental.save
        redirect_to "/buildings/#{params[:building_id]}/rentals/#{params[:id]}"
      else
        render "/buildings/#{params[:building_id]}/rentals/new"
      end
  end

  def edit
    @rental = Rental.find(params[:id])
    authorize @rental
    if @rental.user != current_user
      redirect_to root_path
    end
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    @rental.user = current_user
    authorize @rental
    if @rental.save!
      redirect_to building_path(@building)
    else
      render :edit
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:description, :area, :nb_piece, :price_rent, :type_of_home)
  end
end
