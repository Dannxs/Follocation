class RentalsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
    @rental = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
    authorize @rental
  end

  def new
    @rental = Rental.new(params[:id])
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
    @rental.user = current_user
    authorize @rental
      if @rental.save
        redirect_to rental_path(@rental)
      else
        render "rentals/new"
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
      redirect_to rental_path(@rental)
    else
      render :edit
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:address, :city, :postal_code, :description, :construction_year, :area, :nb_piece, :price_rent)
  end
end
