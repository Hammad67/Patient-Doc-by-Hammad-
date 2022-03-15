require 'rails_helper'

RSpec.describe Patient, type: :model do
  context "Patient validation tests" do
    it "Should save succefully" do
      patient = Patient.new(first_name: "Hammad", last_name: "anything", email: "Hammad@gmail.com", phone_number: "+923486556776")
      expect(patient).to be_valid
    end

    it "will not save succefully due to Email {must contain @ sign}" do
      patient = Patient.new(first_name: "Hammad", last_name: "anything", email: "Hammadgmail.com", phone_number: "+9286556776").save
      expect(patient).to eq(false)
    end
    it "will not save succefully due to absence of first name" do
      patient = Patient.new(first_name: "", last_name: "anything", email: "Hammadgmail.com", phone_number: "+9286556776").save
      expect(patient).to eq(false)
    end
    it "will not save succefully due to absence of last name" do
      patient = Patient.new(first_name: "Hammad", last_name: "", email: "Hammadgmail.com", phone_number: "+9286556776").save
      expect(patient).to eq(false)
    end
    it "will not save succefully due to invalid leangth of phone number{must be 13 charactes}" do
      patient = Patient.new(first_name: "Hammad", last_name: "anything", email: "Hammad@gmail.com", phone_number: "+9286556776").save
      expect(patient).to eq(false)
    end
  end
end
