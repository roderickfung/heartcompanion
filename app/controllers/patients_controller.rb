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
    # @patient.approved = false
    if @patient.update! patient_params
      cookies.delete(:patient_auth)
      redirect_to root_path, notice: "Profile Updated, please await for administrator's approval."
    else
      flash[:alert] = @patient.errors.full_messages.to_sentence
      render :edit
    end
  end

  protected

  def set_patient
    @patient = Patient.find_by_auth_token cookies[:patient_auth]
  end

  def patient_params
    params.require(:patient).permit(:profile_image, :care_id, :first_name, :last_name, :email, :phone, :address, :city, :province, :postal_code, :age, :sex, :password, :password_confirmation)
  end

end
