class TeachersController < ApplicationController
  def create
    otp = rand(1000..9999)  # Generate a 4-digit OTP
    teacher = Teacher.new(phone_number: params[:phone_number], otp: otp)

    if teacher.save
      # Send OTP via SMS or show it for development purposes
      flash[:notice] = "OTP sent to your phone"
      redirect_to login_path
    else
      flash[:alert] = "Unable to register teacher"
      render :new
    end
  end
end
