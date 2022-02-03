class AppointmentsController < ApplicationController
  # def new
  #   @appointment=Appointment.new
  # end
  def create
    @patient=Patient.find(params[:patient_id])
    @appointment=@patient.appointments.create(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  def index

  end
end
def appointment_params
  params.require(:appointments).permit(:date)
end