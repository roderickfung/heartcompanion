class Clinicians::PatientsController < ApplicationController
  before_action :authenticate_clinician!
  before_action :set_clinician
  before_action :set_patient, only: [:show, :edit, :update]

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
    @bphis, @bplows, @heartrates, @weights, @dizzys, @nbreaths, @ebreaths, @swells = [], [], [], [], [], [], [], []

    @patient.patient_logs.each do |log|
      @bphis << log.bp_hi
      @bplows << log.bp_low
      @heartrates << log.heartrate
      @weights << log.weight_num
      @nbreaths << log.night_breath
      @ebreaths << log.exerting_breath
      @swells << log.leg_swollen
      @dizzys << log.lightheadedness
    end

    render layout: 'clinician-dash'
  end

  def edit

    render layout: 'clinician-dash'
  end

  def update

  end

  protected

  def set_clinician
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
  end

  def set_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(:bp_hi , :bp_low, :heartrate, :weight_num)
  end

end
