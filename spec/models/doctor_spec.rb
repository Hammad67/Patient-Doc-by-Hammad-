require 'rails_helper'

RSpec.describe Doctor, type: :model do

  context "validation tests" do
    it "Should save succefully" do
      doctor = Doctor.new(first_name: "Hammad", last_name: "anything", email: "Hammad@gmail.com", password:"ahgvcasghv",phone_number: "+923486556776")
      expect(doctor).to be_valid
    end
    it "is not a valid phone number" do
      doctor = Doctor.new(phone_number: nil)
      expect(doctor).to_not be_valid
    end
    it "is not a valid Email" do
      doctor = Doctor.new(email: nil)
      expect(doctor).to_not be_valid
    end
    it "is valid Email" do
      doctor = Doctor.new(email: "spmethimg@example.com")
      expect(doctor).to be_valid
    end

    it "is valid phone number" do
      doctor = Doctor.new(phone_number: "Anything")
      expect(doctor).to be_valid
    end
  end
end
