class CreateMedicalRecord
  include Interactor
  def call
    medical = MedicalRecord.new(context.medical_params)
    medical.patient_id = context.patient
    if medical.save
      context.medical = medical
    else
      context.medical = medical
      context.fail!
    end
  end
end