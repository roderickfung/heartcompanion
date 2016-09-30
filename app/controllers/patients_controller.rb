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
    if clinician_signed_in?
      @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
      render layout: 'clinician-dash'
    else
      render layout: 'patient-dash'
    end
  end

  def show
    if clinician_signed_in?
      @clinician = Clinician.find params[:clinician_id]
      render layout: 'clinician-dash'
    else

      render layout: 'patient-dash'
    end
  end

  def edit
    if clinician_signed_in?
      @clinician = Clinician.find params[:clinician_id]
      render layout: 'clinician-dash'
    else

      render layout: 'patient-dash'
    end
  end

  def update

  end

  def destroy

  end

  protected

  def patient_params
    params.require(:patient).permit(:role, :care_id, :first_name, :last_name, :email, :phone, :address, :age, :sex, :password, :password_confirmation)
  end

end
