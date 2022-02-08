class VisitsController < ApplicationController
  def new
    @appointment = Appointment.find(params[:appointment_id])
    @patient = Patient.find(params[:patient_id])
    if @appointment.visit.present?
      redirect_to root_path
    else
      @visit = @appointment.create_visit
      redirect_to patient_appointment_visit_path(@patient, @appointment, @visit)
      flash[:notice] = "Patient has successfully visit"
    end
  end
end
