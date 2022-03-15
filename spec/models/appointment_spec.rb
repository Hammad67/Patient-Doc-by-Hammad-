require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "Appointment validation tests" do
    it "Should save succefully" do
      doctor = Doctor.new(first_name: "Hammad", last_name: "anything", email: "Hammad@gmail.com", password: "ahgvcasghv", phone_number: "+923486556776")
      patient = Patient.new(first_name: "Hammad", last_name: "anything", email: "Hammad@gmail.com", phone_number: "+923486556776")
      appointment = Appointment.new(date: DateTime.now, patient: patient, doctor: doctor)
      expect(appointment).to be_valid
    end
    it "Should not save succefully due to invalid date " do
      appointment = Appointment.new(date: "", patient_id: 1, doctor_id: 2)
      expect(appointment).to_not be_valid
    end
    it "Should not save succefully due to absence of doctor id" do
      appointment = Appointment.new(date: DateTime.now, patient_id: 1)
      expect(appointment).to_not be_valid
    end
    it "Should not save succefully due to absence of patient id" do
      appointment = Appointment.new(date: DateTime.now, doctor_id: 1)
      expect(appointment).to_not be_valid
    end
  end
end
