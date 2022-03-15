require 'rails_helper'

RSpec.describe Prescription, type: :model do
  context "Prescription validation tests" do
    it "Should save succefully" do
      visit = Visit.new()
      prescription = Prescription.new(dose_name: "Anything", dosage_frequency: "anything", dose_detail: "Anything", visit: visit)
      expect(prescription).to be_valid
    end
    it "Should not save succefully due to absensce of dose name,frquency,detail" do
      prescription = Prescription.new(dose_name: "", dosage_frequency: "", dose_detail: "")
      expect(prescription).to_not be_valid
    end
  end
end