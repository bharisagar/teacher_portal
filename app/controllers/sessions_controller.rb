class SessionsController < ApplicationController
  def new
    # Renders the login form
  end

  def create
    teacher = Teacher.find_by(phone_number: params[:phone_number])

    if teacher && teacher.otp == params[:otp]
      session[:teacher_id] = teacher.id  # Save the teacher ID in the session
      redirect_to students_path
    else
      flash[:alert] = "Invalid phone number or OTP"
      render :new
    end
  end


  def destroy
    session[:teacher_id] = nil  # Clear the session, logging out the teacher
    redirect_to root_path  # Redirect back to the login form
  end
end
