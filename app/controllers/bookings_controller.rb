class BookingsController < ApplicationController
 def new
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @booking = Booking.new()

    results = review_params

    checkin = results["checkin"].split("-")
    checkout = results["checkout"].split("-")

    checkinyear = checkin[0].to_i
    checkinmonth = checkin[1].to_i
    checkinday = checkin[2].to_i
    checkoutyear = checkout[0].to_i
    checkoutmonth = checkout[1].to_i
    checkoutday = checkout[2].to_i

    if Date.valid_date?(checkinyear, checkinmonth, checkinday) and Date.valid_date?(checkoutyear, checkoutmonth, checkoutday)

      @booking.checkin = Date.new(checkinyear, checkinmonth, checkinday)
      @booking.checkout = Date.new(checkoutyear, checkoutmonth, checkoutday)

      @booking.boat = @boat
      @booking.user = current_user

      if @booking.save
        redirect_to profile_path
      else
        render :new
      end
    else
      render :new
    end
    authorize @booking
  end

  private

  def review_params
    params.require(:booking).permit("checkin", "checkout")
  end
end
