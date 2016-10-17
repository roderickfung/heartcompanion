class HomeController < ApplicationController

  def index
    if clinician_signed_in?
      @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
      redirect_to clinician_path(@clinician)
    elsif patient_signed_in?
      @patient = Patient.find_by_auth_token cookies[:patient_auth]
      redirect_to patient_path(@patient)
    else
      @clinician = Clinician.new
    end
  end

  def about
    if clinician_signed_in?
      @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
      render layout: 'clinician-dash'
    elsif patient_signed_in?
      @patient = Patient.find_by_auth_token cookies[:patient_auth]
      render layout: 'patient-dash'
    else
      @clinician = Clinician.new
    end
  end


  def why
    if clinician_signed_in?
      @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
      render layout: 'clinician-dash'
    elsif patient_signed_in?
      @patient = Patient.find_by_auth_token cookies[:patient_auth]
      render layout: 'patient-dash'
    else
      @clinician = Clinician.new
    end
  end
  
end
