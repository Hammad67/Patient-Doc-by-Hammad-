class CreateMedicalRecord
  include Interactor

  def call
    medical_record = MedicalRecord.new(context.medical_params)
    medical_record.patient_id = context.patient_id
    context.medical_record = medical_record
    context.fail! unless medical_record.save
  end
end