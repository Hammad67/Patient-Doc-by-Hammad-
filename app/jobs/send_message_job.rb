class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(args)
    @prescription = args[:prescription]
    message = args[:message]
    TwilioTextMessenger.new.send_sms(@prescription, message)
  end
end
