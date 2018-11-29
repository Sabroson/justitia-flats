class BookingsController < ApplicationController
  # creates a new booking
  def create
  end

  # lists the travellers bookings
  def index
    @bookings = Booking.where(user: current_user)
  end

  # lists bookings for a flat
  def flat
  end

  # approves a booking
  def approve
  end

  # rejects a booking
  def reject
  end
end
