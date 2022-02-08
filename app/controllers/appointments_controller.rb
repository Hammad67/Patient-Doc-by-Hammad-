class AppointmentsController < ApplicationController
  before_action :get_find_patinet, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :get_find_appointment, only: [:show, :edit, :update, :destroy]

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

  def get_find_patient
    @patient = Patient.find(params[:patient_id])
  end

  def get_find_appointment
    @appointment = @patient.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end