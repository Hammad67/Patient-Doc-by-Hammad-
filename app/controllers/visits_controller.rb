class VisitsController < ApplicationController
  before_action :get_appointment_and_patient

  def new
    if @appointment.visit.present?
      redirect_to root_path
    else
      @visit = CreateVisit.call(appointment: @appointment.id)
      if @visit.success?
        @visit = @visit.visit
        redirect_to patient_appointment_visit_path(@patient, @appointment, @visit)
        flash[:notice] = "Patient has successfully visit"
      end
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end

  private

  def get_appointment_and_patient
    @appointment = Appointment.find(params[:appointment_id])
    @patient = Patient.find(params[:patient_id])
  end
end