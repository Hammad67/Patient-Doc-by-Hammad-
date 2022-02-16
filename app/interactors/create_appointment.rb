class CreateAppointment
  include Interactor

  def call
    appointment = Appointment.new(context.appointment_params)
    appointment.doctor_id=context.currentdoctor
    appointment.patient_id=context.patient
    if appointment.save
      context.appointment=appointment
    else
      context.appointment=appointment
      context.fail!
    end
  end
end
