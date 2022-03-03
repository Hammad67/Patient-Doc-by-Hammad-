class MedicalRecordsController < ApplicationController
  before_action :get_patient, only: [:new, :create, :show, :edit, :update]
  before_action :get_medical_history, only: [:show, :edit, :update]

  def new
    @medical = @patient.medical_records.build
  end

  def create
    result = CreateMedicalRecord.call(medical_params: medical_params, patient: @patient.id)
    @medical = result.medical
    if result.success?
      redirect_to patient_medical_record_path(@patient, @medical)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def update
    if @medical.update(medical_params)
      redirect_to patient_medical_record_path(@patient, @medical)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_medical_history
    @medical = MedicalRecord.find(params[:id])
  end

  def medical_params
    params.require(:medical_record).permit(:patient_bp, :patient_weight, :lab_test, :dieases, :dieases_detail, :lab_test_results)
  end
end
