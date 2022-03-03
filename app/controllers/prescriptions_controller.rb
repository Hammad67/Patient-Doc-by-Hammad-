class PrescriptionsController < ApplicationController
  before_action :get_patient_appointment_and_visit

  def new
    @prescription = @visit.prescriptions.build
  end

  def create
    result = CreatePrescription.call(prescription_params: prescription_params, visit_id: @visit.id)
    @prescription = result.prescription
    if result.success?
      PatientMailer.with(prescription: @prescription).welcome_email.deliver_now
      message = patient_appointment_visit_prescription_path(@patient.id, @appointment.id, @visit.id, @prescription, format: :pdf)
      TwilioTextMessenger.new.send_sms(@prescription, message)
      redirect_to patient_appointment_visit_prescription_path(@patient, @appointment, @visit, @prescription)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "print_prescription",
               template: 'prescriptions/print_prescription',
               formats: [:pdf], layout: "application",
               :page_height => '8in', :page_width => '7in'
      end
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:dose_name, :dosage_frequency, :dose_detail)
  end

  def get_patient_appointment_and_visit
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:appointment_id])
    @visit = Visit.find(params[:visit_id])
  end
end