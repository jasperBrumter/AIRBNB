class PagesController < ApplicationController
  def home
  end

  def profile
    @user = current_user
    @boats = Boat.where(user: @user)
    @bookings = Booking.where(user: @user)
  end
end
