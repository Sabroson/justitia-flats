class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :date_of_birth])
  end

  def after_sign_in_path_for(resource)
    # save booking if there is a temp_booking in the session
    if session[:booking].present?

      @booking = Booking.new(session[:booking].first)
      @booking.flat = Flat.find(session[:booking].last)
      @booking.user = current_user

      # save booking
      @booking.save

      # clear session
      session[:booking] = nil

      # redirect
      flash[:notice] = "Sweet, booking request submitted :)"
      bookings_path

    else
      # if there is not temp booking in the session proceed as normal
      super
    end
  end

end
