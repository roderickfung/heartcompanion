class HomeController < ApplicationController

  def index

    if clinician_signed_in?
      @clinician = Clinician.find session[:clinician_id]
      redirect_to clinician_path(@clinician)
      # render layout: 'clinician-dash'
    elsif patient_signed_in?
      @patient = Patient.find session[:patient_id]
      redirect_to patient_path(@patient)
      # render layout: 'patient-dash'
    else

    end
  end

end
