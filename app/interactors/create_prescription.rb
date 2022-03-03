class CreatePrescription
  include Interactor

  def call
    prescription = Prescription.new(context.prescription_params)
    prescription.visit_id = context.visit
    context.prescription = prescription
    context.fail! unless prescription.save
  end
end
