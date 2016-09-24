class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def clinician_signed_in?
    # binding.pry
    session[:clinician_id].present?
  end
  helper_method :clinician_signed_in?
  #adding a helper_method call as in above, allows the view files (all of them in this case) to have access to this method.

  def patient_signed_in?
    session[:patient_id].present?
  end
  helper_method :patient_signed_in?


  def current_user
    #technique below is called memoization which fetched the user in this case the first time you call the method, and every subsequent time, it uses the one stored in the '@current_user' variable.
    if clinician_signed_in?
      @current_user ||= Clinician.find session[:clinician_id]
    elsif patient_signed_in?
      @current_user ||= Patient.find session[:patient_id]
    end
  end
  helper_method :current_user

  def authenticate_clinician!
    if clinician_signed_in? == false
      redirect_to new_clinicians_session_path
    end
  end

  def authenticate_patient!
    if patient_signed_in? == false
      redirect_to new_patients_session_path
    end
  end
end
