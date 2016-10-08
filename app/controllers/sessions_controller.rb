class SessionsController < ApplicationController

  def new_patient

  end

  def new_clinician

  end

  def create_clinician
    @clinician = Clinician.find_by_username(params[:username])
    if @clinician && @clinician.approved == false
      flash[:alert] = 'Your account has not been approved by an administrator. Please contact us for assistance.'
      render :new_clinician
    elsif @clinician && @clinician.authenticate(params[:password]) && @clinician.approved
      if params[:remember_me]
        cookies.permanent[:clinician_auth] = @clinician.auth_token
      else
        cookies[:clinician_auth] = @clinician.auth_token
      end
      redirect_to root_path, notice: 'Logged in!'
    else
      flash[:alert] = 'Incorrect Credentials'
      redirect_to clinician_log_in_path
    end
  end

  def create_patient
    @patient = Patient.find_by_care_id(params[:care_id])
    if @patient && @patient.approved == false
      flash[:alert] = 'Your account has not been approved by an administrator. Please contact your clinician for more details.'
      render 'new_patient'
    elsif @patient && @patient.authenticate(params[:password]) && @patient.approved
      if params[:remember_me]
        cookies.permanent[:patient_auth] = @patient.auth_token
      else
        cookies[:patient_auth] = @patient.auth_token
      end
      redirect_to root_path, notice: 'Logged in!'
    else
      flash[alert] = 'Incorrect Credentials'
      redirect_to patient_log_in_path
    end
  end

  def destroy
    if cookies[:clinician_auth].present?
      cookies.delete(:clinician_auth)
    else
      cookies.delete(:patient_auth)
    end
    redirect_to root_path, notice: 'Logged out'
  end
end
