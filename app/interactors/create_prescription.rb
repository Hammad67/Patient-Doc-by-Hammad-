class CreatePrescription
  include Interactor

  def call
    create_prescription
    send_prescription_email
  end

  private

  def create_prescription
    @prescription = Prescription.new(context.prescription_params)
    @prescription.visit_id = context.visit_id
    context.prescription = @prescription
    context.fail! unless @prescription.save
  end

  def send_prescription_email
    PatientMailer.with(prescription: @prescription).welcome_email.deliver_later
  end
end
