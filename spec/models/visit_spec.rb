require 'rails_helper'

RSpec.describe Visit, type: :model do
  context "Visit validation tests" do
    patient = Patient.new(first_name: "Hmad", last_name: "anything", email: "dc@gmail.com", phone_number: "+923486556774")
    doctor = Doctor.new(first_name: "Hammad", last_name: "anything", email: "HFGGd@gmail.com", password: "ahgvcasghv", phone_number: "+923486556776")
    appointment = Appointment.new(date: DateTime.now, patient: patient, doctor: doctor)
    it "Should save succefully [appointment must exist for visit]" do
      patient = Patient.new(first_name: "Hmad", last_name: "anything", email: "dc@gmail.com", phone_number: "+923486556774")
      doctor = Doctor.new(first_name: "Hammad", last_name: "anything", email: "HFGGd@gmail.com", password: "ahgvcasghv", phone_number: "+923486556776")
      appointment = Appointment.new(date: DateTime.now, patient: patient, doctor: doctor)
      visit = Visit.new(appointment: appointment)
      expect(visit).to be_valid
    end
  end
end
