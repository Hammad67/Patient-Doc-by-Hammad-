class CreateAppointment
  include Interactor

  def call
    appointment = Appointment.new(context.appointment_params)
    appointment.doctor_id = context.currentdoctor
    appointment.patient_id = context.patient
    context.appointment = appointment
    context.fail! unless appointment.save
  end
end
