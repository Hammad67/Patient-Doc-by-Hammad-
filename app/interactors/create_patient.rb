class CreatePatient
  include Interactor

  def call
    patient = Patient.new(context.patient_params)
    context.patient = patient
    context.fail! unless patient.save
  end
end