class CliniciansController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_clinician, only: [:index, :show, :edit, :update, :destroy]

  def new
    @clinician = Clinician.new
  end

  def create
    @clinician = Clinician.new clinician_params
    if @clinician.save
      redirect_to root_path, notice: 'Succesfully Signed Up! Please await Admin approval.'
    else
      flash[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def index

  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  protected

  def clinician_params
    params.require(:clinician).permit(:role, :username, :first_name, :last_name, :email, :phone, :address, :password, :password_confirmation)
  end

  def set_clinician
    @clinician = Clinician.find params[:id]
  end

end
