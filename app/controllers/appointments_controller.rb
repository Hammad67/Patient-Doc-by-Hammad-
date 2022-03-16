class AppointmentsController < ApplicationController
  before_action :get_patient, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :get_appointment, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @appointment = @patient.appointments.build
  end

  def create
    result = CreateAppointment.call(current_doctor_id: current_doctor.id, patient_id: @patient.id, appointment_params: appointment_params)
    @appointment = result.appointment
    if result.success?
      redirect_to patient_appointment_path(@patient, @appointment)
    else
      render :new, status: :unprocessable_entity
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
