class AppointmentsController < ApplicationController
  before_action :get_patient, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :get_appointment, only: [:show, :edit, :update, :destroy]

  def new
    @appointment = @patient.appointments.build
  end

  def create
    @appointment =CreateAppointment.call(currentdoctor:current_doctor.id,patient:@patient.id,appointment_params:appointment_params)
    if @appointment.success?
      @appointment=@appointment.appointment
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @appointment.update(appointment_params)
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render :edit
    end
  end

  def destroy
    if @appointment.destroy
      redirect_to root_path
    end
  end

  private

  def get_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_appointment
    @appointment = @patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end