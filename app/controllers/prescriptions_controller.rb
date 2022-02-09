class PrescriptionsController < ApplicationController
  before_action :get_patient_appointment_visit

  def new
    @prescription = @visit.prescriptions.build
  end

  def create
    @prescription = @visit.prescriptions.new(prescription_params)
    if @prescription.save
      redirect_to patient_appointment_visit_prescription_path(@patient, @appointment, @visit, @prescription)
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "print_prescription", template: 'prescriptions/print_prescription', formats: [:html]
      end
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:dose_name, :dosage_frequency, :dose_detail)
  end

  def get_patient_appointment_visit
    @patient = Patient.find(params[:patient_id])
    @appointment = Appointment.find(params[:appointment_id])
    @visit = Visit.find(params[:visit_id])
  end
end