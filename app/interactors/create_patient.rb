class CreatePatient
  include Interactor

  def call
    patient = Patient.new(context.patient_params)
    if patient.save
      context.patient = patient
    else
      context.patient = patient
      context.fail!
    end
  end
end