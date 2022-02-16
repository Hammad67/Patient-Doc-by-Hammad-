class CreatePrescription
  include Interactor

  def call
    prescription = Prescription.new(context.prescription_params)
    prescription.visit_id = context.visit
    if prescription.save
      context.prescription = prescription
    else
      context.prescription = prescription
      context.fail!
    end

  end
end