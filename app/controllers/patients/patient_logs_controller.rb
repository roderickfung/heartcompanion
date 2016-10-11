class Patients::PatientLogsController < ApplicationController
  before_action :authenticate_patient!
  before_action :set_patient
  before_action :set_patient_log, only: [:show]
  before_action :set_last_seven_logs

  def new
    @plog = PatientLog.new
    render layout: 'patient-dash'
  end

  def create
    @plog = PatientLog.new patient_log_params
    @plog.patient = @patient
    if @plog.save
      # binding.pry
      redirect_to patient_path(@patient), notice: 'Log Submitted'
    else
      flash[:alert] = "#{@plog.errors.full_messages.to_sentence}"
      render :new
    end
    # render layout: 'patient-dash'
  end

  def index
    @plogs = @patient.patient_logs
    @plwk = @patient.patient_logs.last(7)
    render layout: 'patient-dash'
  end

  def show

    render layout: 'patient-dash'
  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def patient_log_params
    params.require(:patient_log).permit(:date, :bp_hi, :bp_low, :weight_num, :heartrate, :weight_type, :exerting_breath, :night_breath, :leg_swollen, :lightheadedness)
  end

  def set_patient
    @patient = Patient.find_by_auth_token cookies[:patient_auth]
  end

  def set_patient_log
    @log = PatientLog.find params[:id]
  end

  def set_last_seven_logs
    @plwk = @patient.patient_logs.last(7)
  end

end
