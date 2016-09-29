class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def clinician_signed_in?
    # binding.pry
    cookies[:clinician_auth].present?
  end
  helper_method :clinician_signed_in?
  #adding a helper_method call as in above, allows the view files (all of them in this case) to have access to this method.

  def patient_signed_in?
    cookies[:patient_auth].present?
  end
  helper_method :patient_signed_in?


  def current_clinician
    #technique below is called memoization which fetched the user in this case the first time you call the method, and every subsequent time, it uses the one stored in the '@current_user' variable.
    if clinician_signed_in?
      # @current_clinician ||= Clinician.find session[:clinician_id]
      @current_clinician ||= Clinician.find_by_auth_token(cookies[:clinician_auth]) if cookies[:clinician_auth]
    end
  end
  helper_method :current_clinician

  def current_patient
    if patient_signed_in?
      # @current_patient ||= Patient.find session[:patient_id]
      @current_patient ||= Patient.find_by_auth_token(cookies[:patient_auth]) if cookies[:patient_auth]
    end
  end
  helper_method :current_patient

  def authenticate_clinician!
    if clinician_signed_in? == false
      redirect_to clinician_log_in_path
    end
  end

  def authenticate_patient!
    if patient_signed_in? == false
      redirect_to patient_log_in_path
    end
  end
end
