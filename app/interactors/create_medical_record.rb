class CreateMedicalRecord
  include Interactor

  def call
    medical = MedicalRecord.new(context.medical_params)
    medical.patient_id = context.patient_id
    context.medical = medical
    context.fail! unless medical.save
  end
end