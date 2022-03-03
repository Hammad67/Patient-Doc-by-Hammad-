class CreatePrescription
  include Interactor

  def call
    prescription = Prescription.new(context.prescription_params)
    prescription.visit_id = context.visit_id
    context.prescription = prescription
    context.fail! unless prescription.save
  end
end
