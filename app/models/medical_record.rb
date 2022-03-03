class MedicalRecord < ApplicationRecord
  belongs_to :patient, :class_name => "User"
  validates :patient_bp, length: { is: 3 }
  validates :patient_weight, length: { is: 3 }
end
