class MedicalRecordsController < ApplicationController
  before_action :get_patient, only: [:new, :create, :show, :edit, :update]
  before_action :get_medical_history, only: [:show, :edit, :update]

  def new
    @medical_record = @patient.medical_records.build
  end

  def create
    result = CreateMedicalRecord.call(medical_params: medical_params, patient_id: @patient.id)
    @medical_record = result.medical_record
    if result.success?
      redirect_to patient_medical_record_path(@patient, @medical_record)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def edit

  end

  def update
    if @medical_record.update(medical_params)
      redirect_to patient_medical_record_path(@patient, @medical_record)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_medical_history
    @medical_record = MedicalRecord.find(params[:id])
  end

  def medical_params
    params.require(:medical_record).permit(:patient_bp, :patient_weight, :lab_test, :dieases, :dieases_detail, :lab_test_results)
  end
end
