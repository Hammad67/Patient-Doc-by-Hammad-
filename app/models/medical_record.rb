class MedicalRecord < ApplicationRecord
  belongs_to :patient,:class_name => "User"
<<<<<<< HEAD
  validates :patient_bp, length: { is: 3 }
  validates :patient_weight, length: { is: 3 }
=======
>>>>>>> PD-8-bootstrap-theme
end
