class CliniciansController < ApplicationController
  before_action :authenticate_clinician!, except: [:new, :create, :verify]
  before_action :set_clinician, only: [:index, :show, :edit, :update]

  def new
    @clinician = Clinician.new
    redirect_to root_path
  end

  def create
    @clinician = Clinician.new clinician_params
    @clinician.role ||= 'clinician'
    if @clinician.save
      VerificationMailer.verify_account(@clinician).deliver_now
      redirect_to root_path, notice: "Succesfully Signed Up! Please await for an administrator to verify your account."
    else
      flash[:alert] = @clinician.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  def index

  end

  def show
    @patients = @clinician.patients

    @logs = []
    @patients.each do |patient|
      patient.patient_logs.each do |log|
        @logs << log
      end
    end

    @datedp = []
    @patients.each do |patient|
      @datedp << patient if patient.patient_logs.last.date < 7.days.ago
    end
    # @oldpat = @patients.where(age: 60..100).order(age: :desc)
    @atrisk = at_risk_patient

    @hash = Gmaps4rails.build_markers(@patients) do |patient, marker|
      marker.lat patient.latitude
      marker.lng patient.longitude
    end

    render layout: 'clinician-dash'
  end

  def edit

    render layout: 'clinician-dash'
  end

  def update
    # @clinician.approved = false
    if @clinician.update clinician_params
      # cookies.delete(:clinician_auth)
      redirect_to root_path, notice: 'Account Edited. An administrator will verify your changes.'
    else
      flash[:alert] = @clinician.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @clinician == current_user || current_user.admin?
      @clinician.destroy
      redirect_to root_path
    else
      flash[:notice] = 'You do not have permission to do that'
    end
  end

  def verify
    @clinician = Clinician.find_by_auth_token params[:id]

    if @clinician.update(approved: true)
      sign_in_clinician(@clinician)
      redirect_to root_path, notice: 'Account Verified'
    else
      flash[:alert] = "Account activation failed, please try again or contact support"
      redirect_to root_path
    end
  end

  protected

  def clinician_params
    params.require(:clinician).permit(:profile_image, :username, :first_name, :last_name, :email, :phone, :address, :city, :province, :postal_code, :password, :password_confirmation)
  end

  def set_clinician
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
  end

  def at_risk_patient
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
    @atrisk = []
    @patients = @clinician.patients.each do |patient|
  
      @atrisk.push(patient) if patient.in_range?
    end
    return @atrisk
  end

end
