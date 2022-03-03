class VisitsController < ApplicationController
  before_action :get_appointment_and_patient

  def new
    if @appointment.visit.present?
      flash[:notice] = "Patient has already visited please create a New appointment for visit!"
      redirect_to root_path
    else
      result = CreateVisit.call(appointment_id: @appointment.id)
      @visit = result.visit
      if result.success?
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