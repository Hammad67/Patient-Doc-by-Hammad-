require 'twilio-ruby'

class TwilioTextMessenger
  binding.pry
  @account_sid = ENV['twilio_account_sid']
  @auth_token = ENV['twilio_auth_token']
  @@client = Twilio::REST::Client.new(@account_sid, @auth_token)
  @@from = ENV["twilio_phone_number"]

  def send_sms(prescriptions, message)
    @visit = Visit.find(prescriptions.visit_id)
    @patient = @visit.appointment.patient
    binding.pry
    number = @patient.phone_number
    @@client.messages.create(
      from: @@from,
      to: number,
      body: message
    )
  end
end