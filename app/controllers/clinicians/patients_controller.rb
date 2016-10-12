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
      VerificationMailer.verify_account(@clinician).deliver_now
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
    if @patient.update patient_trigger_params
      redirect_to clinicians_patient_path(@patient), notice: 'Parameters Updated'
    else
      flash[:alert] = @patient.errors.full_messages.to_sentence
      render :edit
    end
  end

  def verify
    @patient = Patient.find_by_auth_token params[:id]

    if @patient.update(approved: true)
      sign_in_patient(@patient)
      redirect_to root_path, notice: 'Account Verified'
    else
      flash[:alert] = 'Account activation failed, please try again or contact support'
      redirect_to root_path
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
    params.require(:patient).permit(:care_id, :first_name, :last_name, :age, :sex, :email, :phone, :address, :city, :province, :postal_code, :password, :password_confirmation)
  end

  def patient_trigger_params
    params.require(:patient).permit(:bphigh , :bplow, :hrhigh, :hrlow, :lbhigh, :lblow)
  end

end
