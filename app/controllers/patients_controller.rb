class PatientsController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_patient

  def show

    render layout: 'patient-dash'
  end

  def edit
    render layout: 'patient-dash'
  end

  def update

  end

  protected

  def set_patient
    @patient = Patient.find_by_auth_token cookies[:patient_auth]
  end

  def patient_params
    params.require(:patient).permit(:role, :care_id, :first_name, :last_name, :email, :phone, :address, :age, :sex, :password, :password_confirmation)
  end

end
