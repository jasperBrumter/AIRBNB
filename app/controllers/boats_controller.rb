class BoatsController < ApplicationController

  def index
    @boats = policy_scope(Boat)
    #@boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
    authorize @boat

  end

  def destroy
    @boat = Boat.find(params[:id])
    authorize @boat
    @boat.destroy
    redirect_to boats_path
  end

  def new
    @boat = Boat.new()
    authorize @boat
  end

  def create
    @boat = Boat.new(strongparams)
    authorize @boat
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new
    end
    # @boat.user = params("user_id")
  end

  def edit
    @boat = Boat.find(params[:id])
    authorize @boat
  end

  def update
    Boat.find(params[:id]).update(strongparams)
    @boat = Boat.find(params[:id])
    authorize @boat
    redirect_to boat_path(@boat)
  end

  private

  def strongparams
    params.require("boat").permit(:name, :description, :price, :number_of_crew, :location)
  end
end
