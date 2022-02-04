class AppointmentsController < ApplicationController
  before_action :require_find, only: [:new, :create, :show, :edit,:update, :destroy]

  def new
    @appointment = @patient.appointments.build
  end

  def create
    @appointment = @patient.appointments.build(appointment_params)
    @appointment.doctor_id = current_doctor.id
    if @appointment.save
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render :new
    end
  end

  def show
    @appointment = @patient.appointments.find(params[:id])
  end

  def edit
    @appointment = @patient.appointments.find(params[:id])
  end

  def update
    @appointment = @patient.appointments.find(params[:id])
    if @appointment.update(appointment_params)
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render :edit
    end
  end
  def destroy
    @appointment = @patient.appointments.find(params[:id])
    if @appointment.destroy
      redirect_to root_path
    end
  end
  private
  def require_find
    @patient = Patient.find(params[:patient_id])
  end
  def appointment_params
    params.require(:appointment).permit(:date)
  end
end