class VisitsController < ApplicationController
  before_action :get_find

  def new
    if @appointment.visit.present?
      redirect_to root_path
    else
      @visit = @appointment.create_visit
      redirect_to patient_appointment_visit_path(@patient, @appointment, @visit)
      flash[:notice] = "Patient has successfully visit"
    end
  end

  def show
    @visit = Visit.find(params[:id])

  end
end

private

def get_find
  @appointment = Appointment.find(params[:appointment_id])
  @patient = Patient.find(params[:patient_id])
end