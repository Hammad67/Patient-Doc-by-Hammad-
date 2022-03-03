class PatientMailer < ApplicationMailer
  default from: 'hammadrashid20150@gmail.com'

  def welcome_email
    @prescription = params[:prescription]
    @visit = Visit.find(@prescription.visit_id)
    @appointment = Appointment.find(@visit.appointment_id)
    @patient = @visit.appointment.patient
    mail(to: "#{@patient.email}", subject: "Your prescription link is here!")
  end
end
