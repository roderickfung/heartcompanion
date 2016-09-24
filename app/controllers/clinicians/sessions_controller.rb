class Clinicians::SessionsController < ApplicationController

  def new

  end

  def create
    @clinician = Clinician.find_by_username params[:username]
    if @clinician && @clinician.authenticate(params[:password]) && @clinician.approved?
      session[:clinician_id] = @clinician.id
      redirect_to clinician_path(@clinician), notice: "Signed In Successfully"
    else
      flash[:alert] = "Wrong Credentials"
      render :new
    end
  end

  def destroy
    session[:clinician_id] = nil
    redirect_to root_path, notice: 'Signed out Successfully'
  end

end
