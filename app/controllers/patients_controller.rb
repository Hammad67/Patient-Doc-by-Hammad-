class PatientsController < ApplicationController
  before_action :get_patient, only: [:show, :edit, :update]

  def index
    if params[:patient_name].present?
      @patient = Patient.where(first_name: "#{params[:patient_name]}")
      respond_to do |format|
        format.js {}
        format.html {}
      end
    else
      @patient = Patient.all
    end
  end

  def show
  end

  def new
    @patient = Patient.new
    respond_to do |format|
      format.js
      format.html

    end
  end

  def create
    result = CreatePatient.call(patient_params: patient_params)
    @patient = result.patient
    if result.success?
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def get_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone_number, :address, :date_of_birth)
  end
end
