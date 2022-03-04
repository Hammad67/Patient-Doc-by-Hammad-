require 'twilio-ruby'

class TwilioTextMessenger
  @account_sid = ENV["TWILIO_ACCOUNT_SID"]
  @auth_token = ENV["TWILIO_AUTH_TOKKEN"]
  @@client = Twilio::REST::Client.new(@account_sid, @auth_token)
  @@from = ENV["TWILIO_PHONE_NUMBER"]

  def send_sms(prescriptions, message)
    @visit = Visit.find(prescriptions.visit_id)
    @patient = @visit.appointment.patient
    number = @patient.phone_number
    @@client.messages.create(
      from: @@from,
      to: number,
      body: message
    )
  end
end