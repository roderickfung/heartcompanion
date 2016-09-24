class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new patient_params
    if @patient.save
      redirect_to root_path, notice: 'Succesfully Signed Up! Please await Admin approval.'
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def patient_params
    params.require(:patient).permit(:care_id, :first_name, :last_name, :email, :phone, :address, :age, :sex, :password, :password_confirmation)
  end

end
