class ReviewsController < ApplicationController
 def new
    @boat = Boat.find(params[:boat_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.boat = Boat.find(params[:boat_id])
    @review.save
    authorize @review
    redirect_to boat_path(@review.boat)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
