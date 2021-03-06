class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: :create
  # creates a new booking
  def create
    # Check to see if the user is registered/logged in
    if current_user.nil?
       # Store the form data in the session so we can retrieve it after login
       session[:booking] = [booking_params, params[:flat_id]]
       # Redirect the user to register/login
       redirect_to new_user_registration_path
    else
      # If the user is already logged in, proceed as normal
      @booking = Booking.new(booking_params)
      @booking.flat = Flat.find(params[:flat_id])
      @booking.user = current_user
      @booking.save
      flash[:notice] = "Sweet, booking request submitted :)"
      redirect_to bookings_path
    end
  end

  # lists the travellers bookings
  def index
    @bookings = Booking.where(user: current_user)
  end

  # lists bookings for a flat
  def flat
    @flat = Flat.find(params[:flat_id])
    @bookings = @flat.bookings
  end

  # approves a booking
  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "approved"
    @booking.save
  end

  # rejects a booking
  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
