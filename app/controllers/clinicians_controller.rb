class CliniciansController < ApplicationController
  before_action :authenticate_clinician!, except: [:new, :create]
  before_action :set_clinician, only: [:index, :show, :edit, :update]

  def new
    @clinician = Clinician.new
  end

  def create
    @clinician = Clinician.new clinician_params
    @clinician.role ||= 'clinician'
    if @clinician.save
      redirect_to root_path, notice: "Succesfully Signed Up! Please await for an administrator to verify your account."
    else
      flash[:alert] = @clinician.errors.full_messages.to_sentence
      render :new
    end
  end

  def index

  end

  def show
    @clinician

    render layout: 'clinician-dash'
  end

  def edit

    render layout: 'clinician-dash'
  end

  def update
    @clinician.approved = false
    if @clinician.update clinician_params
      cookies.delete(:clinician_auth)
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

  protected

  def clinician_params
    params.require(:clinician).permit(:role, :username, :first_name, :last_name, :email, :phone, :address, :password, :password_confirmation)
  end

  def set_clinician
    @clinician = Clinician.find_by_auth_token cookies[:clinician_auth]
  end

end
