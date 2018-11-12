class BoatsController < ApplicationController

  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find(params[:id])
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
  end

  def new
    @boat = Boat.new()
  end

  def create
    @boat = Boat.new(strongparams)
    # @boat.user = params("user_id")
  end

  def edit
    @boat = Boat.find(params[:id])
  end

  def update
    #@boat = Boat.find(params[:id])
    #@boat = Boat.update(strongparams)
  end

  private

  def strongparams
    params.require("boat").permit(:name, :price, :number_of_crew, :location)
  end
end
