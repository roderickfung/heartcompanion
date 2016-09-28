class SessionsController < ApplicationController

  def new_patient

  end

  def new_clinician

  end

  def create_clinician
    clinician = Clinician.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = clinician.auth_token
      else
        cookies[:auth_token] = clinician.auth_token
      end
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid username or password'
      render 'clinician_log_in'
    end
  end

  def create_patient
    patient = Patient.find_by_care_id(params[:care_id])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = patient.auth_token
      else
        cookies[:auth_token] = patient.auth_token
      end
      redirect_to root_path, notice: 'Logged in!'
    else
      flash.now.alert = 'Invalid care id or password'
      render '/patient_log_in'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_path, notice: 'Logged out!'
  end
end
