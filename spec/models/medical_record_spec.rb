require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  patient = Patient.new(first_name: "Hammad", last_name: "anything", email: "KC@gmail.com", phone_number: "+923386556776")
  context "Patient validation tests" do
    it "Should save succefully" do
      medical_record = MedicalRecord.new(patient_bp: 222, patient_weight: 123, patient: patient)
      expect(medical_record).to be_valid
    end
    it "Should not save succefully due to length of patient_blood_pressure and patient weight" do
      medical_record = MedicalRecord.new(patient_bp: 2322, patient_weight: 2323, patient: patient)
      expect(medical_record).to_not be_valid
    end
  end
end
