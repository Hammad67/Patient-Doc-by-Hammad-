 class PatientsController < ApplicationController
  def index
    @patient = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(article_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def patient_params
    params.require(:patient).permit(:first_name, :last_name,:email,:phone_number,:address,:date_of_birth)
  end
end
