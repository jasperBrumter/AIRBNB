class BookingsController < ApplicationController
 def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    results = review_params
    checkinyear = results["checkin(1i)"].to_i
    checkinmonth = results["checkin(2i)"].to_i
    checkinday = results["checkin(3i)"].to_i
    checkoutyear = results["checkout(1i)"].to_i
    checkoutmonth = results["checkout(2i)"].to_i
    checkoutday = results["checkout(3i)"].to_i

    @booking = Booking.new()
    @booking.checkin = Date.new(checkinyear, checkinmonth, checkinday)
    @booking.checkout = Date.new(checkoutyear, checkoutmonth, checkoutday)
    @boat = Boat.find(params[:boat_id])
    @booking.boat = @boat
    @booking.user = current_user

    @booking.save

    authorize @booking
    redirect_to profile_path
  end

  private

  def review_params
    params.require(:booking).permit("checkin(1i)","checkin(2i)","checkin(3i)","checkout(1i)","checkout(2i)","checkout(3i)")
  end
end
