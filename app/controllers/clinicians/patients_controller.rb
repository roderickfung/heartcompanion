class Clinicians::PatientsController < ApplicationController
  before_action :authenticate_clinician!
  before_action :set_clinician

  def new
    @patient = Patient.new
    render layout: 'clinician-dash'
  end

  def create
    @patient = Patient.new patient_params
    @patient.clinician_id = @clinician.id
    if @patient.save
      redirect_to clinician_path(@clinician), notice: 'New patient created!'
    else
      flash[:alert] = @patient.errors.full_messages.to_sentence
      render :new
    end
  end

  def index
    @patients = Patient.where(clinician_id: @clinician)

    render layout: 'clinician-dash'
  end

  def show
    
    render layout: 'clinician-dash'
  end

  protected

  def set_clinician
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
  end

  def patient_params
    params.require(:patient).permit(:care_id, :first_name, :last_name, :sex, :age, :email, :phone, :address, :password, :password_confirmation )
  end

end
