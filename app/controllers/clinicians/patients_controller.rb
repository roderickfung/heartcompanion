class Clinicians::PatientsController < ApplicationController
  before_action :authenticate_clinician!
  before_action :set_clinician

  def new

    render layout: 'clinician-dash'
  end

  def create

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

end
