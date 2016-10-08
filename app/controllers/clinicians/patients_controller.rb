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
    @bphis, @bplows, @heartrates, @weights, @dizzys, @nbreaths, @ebreaths, @swells, @plogs = [], [], [], [], [], [], [], [], []

    @patient.patient_logs.limit(30).each do |log|
      @plogs << log
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
    if @patient.update patient_params
      redirect_to clinicians_patient_path(@patient), notice: 'Parameters Updated'
    else
      flash[:alert] = @patient.errors.full_messages.to_sentence
      render :edit
    end
  end

  protected

  def set_clinician
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
  end

  def set_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(:bphigh , :bplow, :hrhigh, :hrlow, :lbhigh, :lblow)
  end

end
