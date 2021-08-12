class RentersController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def index
    @renters = Renter.all
  end

  def show
    @renter = Renter.find(params[:id])
    authorize @renter
  end

  def new
    @renter = Renter.new(params[:id])
    authorize @renter
  end

  def destroy
    @renter = Renter.find(params[:id])
    authorize @renter
    @renter.destroy
    redirect_to new_renter_path
  end

  def create
    @renter = Renter.new(renter_params)
    @renter.user = current_user
    authorize @renter
      if @renter.save
        redirect_to dashboard_path
      else
        render "renters/new"
      end
  end

  def edit
    @renter = Renter.find(params[:id])
    authorize @renter
    if @renter.user != current_user
      redirect_to root_path
    end
  end

  def update
    @renter = Renter.find(params[:id])
    @renter.update(renter_params)
    @renter.user = current_user
    authorize @renter
    if @renter.save!
      redirect_to renter_path(@renter)
    else
      render :edit
    end
  end

  private

  def renter_params
    params.require(:renter).permit(:mister, :first_name, :last_name, :mail, :phone_number, :rental_id)
  end
end
