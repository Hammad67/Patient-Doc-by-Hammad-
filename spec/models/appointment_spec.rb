require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "Appointment validation tests" do
    it "Should save succefully" do
      doctor = Doctor.new(first_name: "Hmad", last_name: "anyting", email: "d@gmail.com", password: "ahgvchv", phone_number: "+903486556776")
      patient = Patient.new(first_name: "ibra", last_name: "anything", email: "dc@gmail.com", phone_number: "+903486556776")
      appointment = Appointment.new(date: DateTime.now, patient: patient, doctor: doctor).save
      expect(appointment).to eq(true)
    end
    it "Should not save succefully due to invalid date absence of patientid and doctor id" do
      appointment = Appointment.new(date: "", patient_id: "", doctor_id: "")
      expect(appointment).to_not be_valid
    end
  end
end
