require 'rails_helper'

RSpec.describe Patient, type: :model do
  context "Patient validation tests" do
    it "Should save succefully" do
      patient = Patient.new(first_name: "Hmad", last_name: "anything", email: "kf@gmail.com", phone_number: "+973486556774")
      expect(patient).to be_valid
    end

    it "will not save succefully due to invalid firstname,lastname,email,phonenumber" do
      patient = Patient.new(first_name: "", last_name: "", email: ".com", phone_number: "+928656776")
      expect(patient).to_not be_valid
    end
  end
end