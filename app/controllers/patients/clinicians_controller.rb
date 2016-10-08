class Patients::CliniciansController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_patient

  def show
    @clinician = @patient.clinician
    @plwk = @patient.patient_logs.last(7)
    render layout: 'patient-dash'
  end

  protected

  def set_patient
    @patient = Patient.find_by_auth_token cookies[:patient_auth]
  end

end
