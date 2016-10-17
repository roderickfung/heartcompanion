class PatientLoggedinController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_patient

  private

    def set_patient
      @patient = Patient.find_by_auth_token cookies[:patient_auth]
    end
end
