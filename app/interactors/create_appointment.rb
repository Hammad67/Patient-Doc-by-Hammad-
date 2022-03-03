class CreateAppointment
  include Interactor

  def call
    appointment = Appointment.new(context.appointment_params)
    appointment.doctor_id = context.current_doctor_id
    appointment.patient_id = context.patient_id
    context.appointment = appointment
    context.fail! unless appointment.save
  end
end
