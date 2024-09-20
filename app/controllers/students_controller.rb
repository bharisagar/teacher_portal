class StudentsController < ApplicationController
  before_action :set_student, only: [ :edit, :update, :destroy ]

  def index
    if params[:query].present?
      # Search students based on the query and ensure they belong to the logged-in teacher
      @students = Student.search(params[:query]).records.where(teacher_id: session[:teacher_id])
    else
      # Fetch all students for the logged-in teacher
      @students = Student.where(teacher_id: session[:teacher_id])
    end
  end

  def new
    @student = Student.new
  end

  def create
    existing_student = Student.find_by(name: student_params[:name], subject: student_params[:subject], teacher_id: session[:teacher_id])

    if existing_student
      # Update the existing student's marks
      existing_student.update(marks: existing_student.marks + student_params[:marks].to_i)
      redirect_to students_path, notice: "Marks updated for existing student."
    else
      @student = Student.new(student_params)
      @student.teacher_id = session[:teacher_id] # Associate with the teacher

      if @student.save
        redirect_to students_path, notice: "Student added successfully."
      else
        render :new
      end
    end
  end

  def edit
    # This action will render the edit view for the student
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: "Student updated successfully."
    else
      render :index
    end
  end

  def destroy
    if @student.destroy
        redirect_to students_path, notice: "Student records Deleted."
    else
        flash[:alert] = "Failed to delete Student records."
        redirect_to students_path
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
