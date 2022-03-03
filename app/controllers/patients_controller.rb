class PatientsController < ApplicationController
  before_action :get_patient, only: [:show, :edit, :update]

  def index
    @patient = Patient.all
  end

  def show
  end

  def new
    @patient = Patient.new
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
    if @patient.update(article_params)
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
